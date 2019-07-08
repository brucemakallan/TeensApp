import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../assets.dart';
import './firestore_db.dart';

class GoogleAuthButton extends StatefulWidget {
  @override
  _GoogleAuthButtonState createState() => _GoogleAuthButtonState();
}

class _GoogleAuthButtonState extends State<GoogleAuthButton> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool active;

  @override
  void initState() {
    super.initState();
    active = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: _buttonLoader(
          AnimationAssets.buttonLoaderGoogle, 'Login with Google'),
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    return user;
  }

  Widget _buttonLoader(String animationAsset, String buttonText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          active = true;
        });
        _handleSignIn().then((FirebaseUser user) {
          print("Signed in " + user.displayName);
          // add user to Firebase database
          User(user.email, user.displayName, imageUrl: user.photoUrl)
              .createUser()
              .then((res) => print('Google User registered successfully'))
              .catchError((e) => print("Google User Registration Error: $e"));
        }).catchError((e) => print("Google Firebase Auth Error: $e"));
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FlareActor(
            animationAsset,
            animation: active ? 'go' : 'idle',
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
            callback: (animationName) {
              setState(() {
                active = false;
              });
            },
          ),
          Opacity(
            opacity: active ? 0.0 : 1.0,
            child: Material(
              child: Text(
                buttonText,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}