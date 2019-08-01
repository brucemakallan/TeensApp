import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:teens_app/screens/home.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../utils/firestore_db.dart';
import '../utils/shared_pref.dart';
import './scale_animation.dart';
import '../state.dart';

class FacebookAuthButton extends StatefulWidget {
  @override
  _FacebookAuthButtonState createState() => _FacebookAuthButtonState();
}

class _FacebookAuthButtonState extends State<FacebookAuthButton> {
  final FacebookLogin facebookSignIn = new FacebookLogin();
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
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
          context, AnimationAssets.buttonLoaderFacebook, 'Login with Facebook'),
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    final FacebookLoginResult result =
        await facebookSignIn.logInWithReadPermissions(['email']);
    AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token);
    FirebaseUser user = await _fAuth.signInWithCredential(credential);
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
          print('Facebook Sign in Successful');

          // Register user with Firebase
          User(user.providerData[0].email, user.providerData[0].displayName,
                  imageUrl: user.photoUrl)
              .createUser()
              .then((res) {
            SharedPref('email')
                .setValue(user.providerData[0].email)
                .then((void x) {
              print('Facebook User registered successfully');
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
            print("Facebook User Registration Error: $e");
            globalState.loading = false;
          });
        }).catchError((e) {
          print("Facebook Firebase Auth Error: $e");
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
                    color: Colors.white,
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
