import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": userCredential.user!.email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    }
  }

  Future<void> googleSignUp() async {
    final GoogleSignIn google = GoogleSignIn();
    final GoogleSignInAccount? googleAcc = await google.signIn();
    final googleAuth = await googleAcc!.authentication;
    final auth = _firebaseAuth.signInWithCredential(
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ),
    );
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  Future<UserCredential> signUp(
      String email, String password, String fullname) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection("users").doc(userCredential.user!.uid).set(
        {
          "uid": userCredential.user!.uid,
          "email": userCredential.user!.email,
          "fullname": fullname
        },
      );
      return userCredential;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    }
  }
}
