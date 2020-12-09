import 'package:firebase_auth/firebase_auth.dart';
import 'package:planningpoker/logger.dart';

class FirebaseService {
  static final FirebaseService _singleton = FirebaseService._internal();
  FirebaseService._internal();

  factory FirebaseService() {
    return _singleton;
  }

  final log = getLogger('FirebaseService');

  final auth = FirebaseAuth.instance;

  /// Sign-in anonymously to Firebase.
  Future<User> signInAnonymously() async {
    log.d('signInAnonymously');
    final result = await auth.signInAnonymously().catchError((error) {
      log.e('signInAnonymously | $error');
      signOut();
      return null;
    });

    return result?.user;
  }

  Future signOut() async {
    return auth.signOut();
  }
}
