import 'package:flutter/material.dart';

import './app_bar.dart';
import './tabs/life_skills.dart';
import './tabs/devotionals.dart';
import './tabs/resources.dart';
import './tabs/quizzes.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(context).getAppBar(),
          body: TabBarView(
            children: <Widget>[
              LifeSkills(),
              Devotionals(),
              Resources(),
              Quizzes(),
            ],
          ),
        ),
      ),
    );
  }
}
