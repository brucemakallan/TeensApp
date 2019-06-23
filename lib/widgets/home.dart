import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        color: Colors.green,
      ),
    );
  }
}
