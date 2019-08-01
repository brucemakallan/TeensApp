import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/shared_pref.dart';
import 'login.dart';
import '../widgets/scale_animation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController(initialPage: 0);
  final int numberOfPages = 2;
  int currentPage = 0;
  final double marginBeforeAnimation = 150;
  final int animationDuration = 1500;
  String email = '';

  @override
  void initState() {
    pageController.addListener(() {
      int next = pageController.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
          email = '';
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SharedPref('email')
        .getValue()
        .then((value) => setState(() {
              email = value;
            }))
        .catchError((e) => setState(() {
              email = '';
            }));

    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: numberOfPages,
        itemBuilder: (context, int currentIndex) {
          bool active = currentPage == currentIndex;
          return SafeArea(child: _buildPage(context, active));
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, bool isActive) {
    final double topAndBottom = isActive ? 0 : marginBeforeAnimation;
    final double leftAndRight = isActive ? 0 : marginBeforeAnimation;

    return Container(
      color: CustomTheme.primary300,
      child: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        curve: Curves.easeOutExpo,
        margin: EdgeInsets.only(
            top: topAndBottom,
            bottom: topAndBottom,
            left: leftAndRight,
            right: leftAndRight),
        child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    SharedPref('email').removeKey();
                    Navigator.pushReplacement(
                      context,
                      ScaleRoute(page: Login()),
                    );
                  },
                  child: Text('Log Out'),
                ),
                Text(email),
              ],
            )),
      ),
    );
  }
}
