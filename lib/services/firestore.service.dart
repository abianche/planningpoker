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
    );

    final ds = await d.get();
    final room = Room.fromJson(ds.data()).copyWith(uid: ds.id);
    return room;
  }

  /// Returns the `uid` of the room if a room with the given `name` exists. `null` otherwise.
  Future<String> roomExists(String name) async {
    final ds =
        await FirebaseFirestore.instance.collection(_room_collection).limit(1).where('name', isEqualTo: name).get();
    if (ds.size == 0) return null;

    return ds.docs.single.id;
  }
}
