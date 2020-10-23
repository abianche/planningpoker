import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final auth = FirebaseAuth.instance;

  Future<User> signInAnonymously(AuthCredential credential) async {
    final result = await auth.signInAnonymously().catchError((error) {
      print(error);
      signOut();
      return null;
    });

    return result?.user;
  }

  Future signOut() async {
    return auth.signOut();
  }
}
