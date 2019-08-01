import 'dart:core';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:crypto/crypto.dart';

class User {
  final String oAuthEmail;
  final String displayName;
  final String imageUrl;

  User(this.oAuthEmail, this.displayName, {this.imageUrl});

  Future<void> createUser() => FirebaseDatabase.instance
          .reference()
          .child(md5.convert(utf8.encode(oAuthEmail)).toString())
          .set({
        'email': oAuthEmail,
        'username': displayName,
        'profilePic': imageUrl,
        'dateCreated': DateTime.now().toIso8601String()
      });
}
