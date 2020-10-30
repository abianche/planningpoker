import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planningpoker/logger.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';

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

  Future<Room> createRoom(
    String name,
  ) async {
    CollectionReference rooms = firestore.collection(_room_collection);

    final d = await rooms.add(
      {
        'name': name,
        'players': [],
        'last_updated': DateTime.now().millisecondsSinceEpoch,
      },
    ).catchError((error) => log.e('createRoom | $error'));

    final room = Room(name: name, players: [], uid: d.id);
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
    final dr = await FirebaseFirestore.instance.collection(_room_collection).doc(roomId);

    return firestore.runTransaction((t) async {
      final ds = await t.get(dr);
      if (!ds.exists) throw Exception('Room $roomId` does not exist!');

      List<dynamic> playersRaw = ds.data()['players'];
      List<Player> players = playersRaw.map((e) => Player.fromJson(e)).toList();

      final playerIndex = players.indexWhere((e) => e.username == playerName);
      if (playerIndex == -1) return false;

      return true;
    }).catchError((error) => log.e('playerExists | $error'));
  }

  Future<void> createPlayer(String roomId, Player player) async {
    final dr = await FirebaseFirestore.instance.collection(_room_collection).doc(roomId);

    return firestore.runTransaction((t) async {
      final ds = await t.get(dr);
      if (!ds.exists) throw Exception('Room $roomId` does not exist!');

      await ds.reference.update({
        'players': FieldValue.arrayUnion([player.toJson()])
      });

      return;
    }).catchError((error) => log.e('createPlayer | $error'));
  }
}
