import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:persotrainer/models/user.dart' as localUser;
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:provider/provider.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(
      {BuildContext context, String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code;
    }
  }

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      return googleUser.email;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signInWithFacebook() async {
    try {
      final AccessToken result = await FacebookAuth.instance.login();
      final FacebookAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.token);
      await _firebaseAuth.signInWithCredential(facebookAuthCredential);
      return "Signed In With Facebook";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
