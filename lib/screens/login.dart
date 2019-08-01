import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../widgets/google_auth.dart';
import '../widgets/facebook_auth.dart';
import '../state.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    GlobalState globalState = Provider.of<GlobalState>(context);

    return Container(
        color: CustomTheme.sky,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: FlareActor(
                AnimationAssets.sunClouds,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                animation: 'Sun Rotate',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Color.fromARGB(200, 255, 255, 255),
                  margin: EdgeInsets.all(30),
                  child: ListTile(
                    leading: Image.asset(LocalImages.logo),
                    title: Text('Hi there,'),
                    subtitle: Text(
                        "Excited to have you here. Let's get you up and running"),
                    isThreeLine: true,
                  ),
                ),
                GoogleAuthButton(),
                FacebookAuthButton(),
              ],
            ),
            globalState.loading
                ? Container(
                    color: Color.fromARGB(160, 255, 255, 255),
                    child: Center(child: CircularProgressIndicator()))
                : Container(),
          ],
        ));
  }
}
