import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:teens_app/screens/home.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../utils/firestore_db.dart';
import '../utils/shared_pref.dart';
import './scale_animation.dart';
import '../state.dart';

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
          context, AnimationAssets.buttonLoaderGoogle, 'Login with Google'),
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

  Widget _buttonLoader(
      BuildContext context, String animationAsset, String buttonText) {
    GlobalState globalState = Provider.of<GlobalState>(context);

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
              .then((res) {
            SharedPref('email').setValue(user.email).then((void x) {
              print('Google User registered successfully');
              globalState.loading = false;
              Navigator.pushReplacement(
                context,
                ScaleRoute(page: Home()),
              );
            }).catchError((e) {
              print('Could not save email to shared preferences');
              globalState.loading = false;
            });
          }).catchError((e) {
            print("Google User Registration Error: $e");
            globalState.loading = false;
          });
        }).catchError((e) {
          print("Google Firebase Auth Error: $e");
          globalState.loading = false;
        });
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
              globalState.loading = true;
              setState(() {
                active = false;
              });
            },
          ),
          Opacity(
            opacity: active ? 0.0 : 1.0,
            child: Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                buttonText,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontFamily: 'MontserratLight',
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
