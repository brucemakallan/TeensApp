import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './menu_controller.dart';

class CustomAppBar {
  final BuildContext context;

  CustomAppBar(this.context);

  PreferredSizeWidget getAppBar() => AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<MenuController>(context, listen: true).toggle();
            }),
      );
}
