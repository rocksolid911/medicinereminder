import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
    await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
    await _firebaseAuth.signInWithCredential(credential);
    final User? user = authResult.user;
    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);
    final User? currentUser = _firebaseAuth.currentUser;
    assert(user!.uid == currentUser!.uid);
    print('signInWithGoogle succeeded: $user');
    return user!;
  }

  Future<void> signOutGoogle() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }
}