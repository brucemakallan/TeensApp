import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './menu_controller.dart';
import '../../utils/assets.dart';

class CustomAppBar {
  final BuildContext context;
  final List<Tab> allTabs = [
    Tab(text: 'Life Skills'),
    Tab(text: 'Devotionals'),
    Tab(text: 'Resources'),
    Tab(text: 'Quizzes'),
  ];

  CustomAppBar(this.context);

  PreferredSizeWidget getAppBar() => AppBar(
        backgroundColor: CustomTheme.primary400,
        elevation: 5,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              Provider.of<MenuController>(context, listen: true).toggle();
            }),
        bottom: TabBar(
          tabs: allTabs.map((tab) => tab).toList(),
        ),
      );
}
