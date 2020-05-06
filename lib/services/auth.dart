import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:burger_city/utils/error.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password, String username);

  Future<FirebaseUser> getCurrentUser();

  // Future<void> sendEmailVerification();

  Future<void> signOut();

  // Future<bool> isEmailVerified();

  // Future<void> changeEmail(String email);

  // Future<void> changePassword(String password);

  // Future<void> sendPasswordResetMail(String email);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userRef = Firestore.instance.collection('users');
  final DateTime timestamp = DateTime.now();

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    return user.uid;
  }

  Future<String> signUp(String email, String password, String username) async {
    final QuerySnapshot docsSnapshot =
        await userRef.where("username", isEqualTo: username).getDocuments();
    if (docsSnapshot.documents.isNotEmpty) {
      return Future.error(CustomError("username already exists"),
          StackTrace.fromString("This is its trace"));
    }

    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    await userRef.document(user.uid).setData(
        {"email": email, "username": username, "timestamp": timestamp});
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
