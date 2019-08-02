import 'package:flutter/material.dart';

import './app_bar.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(context).getAppBar(),
          body: TabBarView(
            children: <Widget>[
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
