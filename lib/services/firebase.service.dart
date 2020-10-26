import 'package:firebase_auth/firebase_auth.dart';
import 'package:planningpoker/logger.dart';

class FirebaseService {
  final log = getLogger('FirebaseService');
  final auth = FirebaseAuth.instance;

  /// Sign-in anonymously to Firebase.
  Future<User> signInAnonymously(AuthCredential credential) async {
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
