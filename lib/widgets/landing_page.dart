import 'package:flutter/material.dart';

import './splash_screen.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final PageController pageController = PageController(initialPage: 0);
  final int numberOfPages = 2;
  int currentPage = 0;

  @override
  void initState() {
    pageController.addListener(() {
      int next = pageController.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          itemCount: numberOfPages,
          itemBuilder: (context, int currentIndex) {
            bool active = currentPage == currentIndex;
            if (currentIndex == 0)
              return SplashScreen(pageController);
            else
              return SafeArea(child: _buildHomePage(active));
          },
        ),
      ),
    );
  }

  Widget _buildHomePage(bool isActive) {
    final double topAndBottom = isActive ? 0 : 200;
    final double leftAndRight = isActive ? 0 : 150;

    return AnimatedContainer(
      duration: Duration(milliseconds: 2000),
      curve: Curves.easeOutExpo,
      margin: EdgeInsets.only(
          top: topAndBottom,
          bottom: topAndBottom,
          left: leftAndRight,
          right: leftAndRight),
      child: Container(
        color: Colors.black,
      ),
    );
  }
}
