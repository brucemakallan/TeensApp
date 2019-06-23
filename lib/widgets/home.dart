import 'package:flutter/material.dart';

import '../assets.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: numberOfPages,
        itemBuilder: (context, int currentIndex) {
          bool active = currentPage == currentIndex;
          return SafeArea(child: _buildPage(active));
        },
      ),
    );
  }

  Widget _buildPage(bool isActive) {
    final double topAndBottom = isActive ? 0 : marginBeforeAnimation;
    final double leftAndRight = isActive ? 0 : marginBeforeAnimation;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(LocalImages.pageBackground),
              repeat: ImageRepeat.repeat)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        curve: Curves.easeOutExpo,
        margin: EdgeInsets.only(
            top: topAndBottom,
            bottom: topAndBottom,
            left: leftAndRight,
            right: leftAndRight),
        child: Container(
          color: CustomTheme.accent900,
        ),
      ),
    );
  }
}
