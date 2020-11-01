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

  Future<Room> createRoom(
    String name,
  ) async {
    final rooms = firestore.collection(_room_collection);

    final d = await rooms.add(
      {
        'name': name,
        'last_updated': DateTime.now().millisecondsSinceEpoch,
      },
    ).catchError((error) => log.e('createRoom | $error'));

    final room = Room(name: name, players: {}, uid: d.id);
    return room;
  }

  /// Returns the `uid` of the room if a room with the given `name` exists. `null` otherwise.
  Future<String> roomExists(String name) async {
    final ds = await FirebaseFirestore.instance
        .collection(_room_collection)
        .limit(1)
        .where('name', isEqualTo: name)
        .get()
        .catchError((error) => log.e('roomExists | $error'));

    if (ds.size == 0) return null;

    return ds.docs.single.id;
  }

  /// Returns `true` if the a player with username `playerName` exists in room with uid `roomId`. `false` otherwise.
  Future<bool> playerExists(String roomId, String playerName) async {
    final uid = FirebaseService().auth.currentUser.uid;

    final ds = await FirebaseFirestore.instance
        .collection(_room_collection)
        .doc(roomId)
        .collection(_players_collection)
        .limit(1)
        .where('username', isEqualTo: playerName)
        .where('uid', isEqualTo: uid) //FIXME: this should be notEqual
        .get()
        .catchError((error) => log.e('playerExists | $error'));

    if (ds.size == 0) return false;

    return true;
  }

  Future<void> createPlayer(String roomId, Player player) async {
    final cr =
        await FirebaseFirestore.instance.collection(_room_collection).doc(roomId).collection(_players_collection);

    await cr.doc(player.username).set(player.toJson()).catchError((error) => log.e('createPlayer | $error'));
  }

  Future<void> updatePlayerStatus(String roomId, Player player) async {
    final dr = await FirebaseFirestore.instance
        .collection(_room_collection)
        .doc(roomId)
        .collection(_players_collection)
        .doc(player.username);

    await dr.set(player.toJson()).catchError((error) => log.e('createPlayer | $error'));
  }

  getPlayersStream()
}
