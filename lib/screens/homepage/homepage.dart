import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './menu_page.dart';
import './zoom_scaffold.dart';
import './menu_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  MenuController menuController;

  _HomePageState() {
    menuController = new MenuController(vsync: this);
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
                  child: Container(
                    color: Colors.white,
                  ),
                )),
      ),
    );
  }
}
