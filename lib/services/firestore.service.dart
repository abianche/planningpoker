import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planningpoker/logger.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/services/firebase.service.dart';

/// Service class for Firestore.
class FirestoreService {
  static final FirestoreService _singleton = FirestoreService._internal();
  FirestoreService._internal();

  factory FirestoreService() {
    return _singleton;
  }

  final log = getLogger('FirestoreService');

  final firestore = FirebaseFirestore.instance;
  static const _room_collection = "rooms";
  static const _players_collection = "players";

  Future<Room> createRoom(String name, Player player) async {
    log.d('createRoom | name:$name');
    final rooms = firestore.collection(_room_collection);

    final d = await rooms.add(
      {
        'name': name,
        'last_updated': DateTime.now().millisecondsSinceEpoch,
        'owner': player.username,
      },
    ).catchError((error) {
      log.e('createRoom | $error');
    });

    final room = Room(
      name: name,
      uid: d.id,
      owner: player.username,
    );
    return room;
  }

  /// Returns the `uid` of the room if a room with the given `name` exists. An empty string otherwise.
  Future<Room> roomExists(String name) async {
    log.d('roomExists | name:$name');
    final ds = await this
        .firestore
        .collection(_room_collection)
        .limit(1)
        .where(
          'name',
          isEqualTo: name,
        )
        .get()
        .catchError(
      (error) {
        log.e('roomExists | $error');
      },
    );

    if (ds.size == 0) return Room.initialState();

    return Room(uid: ds.docs.single.id, name: name, owner: ds.docs.single.data()["owner"] ?? "");
  }

  /// Returns `true` if the a player with username `playerName` exists in room with uid `roomId`. `false` otherwise.
  Future<bool> playerExists(String roomId, String playerName) async {
    log.d('playerExists | roomId:$roomId playerName:$playerName');
    final user = FirebaseService().auth.currentUser;
    if (user == null) {
      return false;
    }
    final uid = user.uid;
    final ds = await this
        .firestore
        .collection(_room_collection)
        .doc(roomId)
        .collection(_players_collection)
        .limit(1)
        .where('username', isEqualTo: playerName)
        .get()
        .catchError((error) {
      log.e('playerExists | $error');
    });

    if (ds.size == 0) return false;
    if (ds.docs.single.id == uid) return false;

    return true;
  }

  Future<void> createPlayer(String roomId, Player player) async {
    log.d('createPlayer | roomId:$roomId player:$player');
    final user = FirebaseService().auth.currentUser;
    if (user == null) {
      throw ('User is null');
    }
    final cr = await this.firestore.collection(_room_collection).doc(roomId).collection(_players_collection);

    await cr.doc(user.uid).set(player.toJson()).catchError((error) => log.e('createPlayer | $error'));
  }

  Future<void> updatePlayerStatus(String roomId, Player player) async {
    log.d('updatePlayerStatus | roomId:$roomId player:$player');
    final user = FirebaseService().auth.currentUser;
    if (user == null) {
      throw ('User is null');
    }
    final dr =
        await this.firestore.collection(_room_collection).doc(roomId).collection(_players_collection).doc(user.uid);

    await dr.set(player.toJson()).catchError((error) => log.e('updatePlayerStatus | $error'));
  }

  Stream<QuerySnapshot> getPlayersStream(String roomId) {
    log.d('getPlayersStream | roomId:$roomId');
    return this.firestore.collection(_room_collection).doc(roomId).collection(_players_collection).snapshots();
  }

  Future<void> deleteCurrentPlayer(String roomId) async {
    log.d('deleteCurrentPlayer | roomId:$roomId');
    final user = FirebaseService().auth.currentUser;
    if (user == null) {
      throw ('User is null');
    }
    final cr = await this.firestore.collection(_room_collection).doc(roomId).collection(_players_collection);

    await cr.doc(user.uid).delete().catchError((error) => log.e('deleteCurrentPlayer | $error'));
  }

  Future<void> clearAllPlayerCards(String roomId) async {
    log.d('clearAllPlayerCards | roomId:$roomId');
    final user = FirebaseService().auth.currentUser;
    if (user == null) {
      throw ('User is null');
    }
    final cr = await this.firestore.collection(_room_collection).doc(roomId).collection(_players_collection);
    final qs = await cr.get();

    for (final doc in qs.docs) {
      await doc.reference.update({
        'currentCard': '_?',
      });
    }
  }
}
