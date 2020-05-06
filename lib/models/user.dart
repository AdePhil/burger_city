import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final int id;
  final String email;
  final String username;

  User({this.id, this.email, this.username});

  factory User.fromDocToUser(DocumentSnapshot doc) {
    return User(email: doc["email"], username: doc['username'], id: doc['id']);
  }
}
