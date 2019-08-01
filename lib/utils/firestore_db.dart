import 'package:firebase_database/firebase_database.dart';
import 'dart:core';

class User {
  final String oAuthEmail;
  final String displayName;
  final String imageUrl;

  User(this.oAuthEmail, this.displayName, {this.imageUrl});

  Future<void> createUser() =>
      FirebaseDatabase.instance.reference().push().set({
        'email': oAuthEmail,
        'username': displayName,
        'profilePic': imageUrl,
        'dateCreated': DateTime.now().toIso8601String()
      });
}
