import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state.dart';
import '../../widgets/scale_animation.dart';
import '../login.dart';
import './circular_image.dart';
import './menu_controller.dart';
import '../../utils/assets.dart';
import '../../utils/shared_pref.dart';

class MenuScreen extends StatelessWidget {
  final List<MenuItem> primaryOptions = [
    MenuItem(Icons.search, Constants.SEARCH),
    MenuItem(Icons.power, Constants.CONNECT_WITH_GOD),
    MenuItem(Icons.favorite, Constants.FAVORITES),
  ];
  final List<MenuItem> secondaryOptions = [
    MenuItem(Icons.help, Constants.HELP_DESK),
    MenuItem(Icons.insert_link, Constants.OUR_WEBSITE),
    MenuItem(Icons.lock, Constants.PRIVACY_POLICY),
    MenuItem(Icons.exit_to_app, Constants.LOG_OUT),
  ];

  @override
  Widget build(BuildContext context) {
    GlobalState globalState = Provider.of<GlobalState>(context);

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < 0) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 60,
            left: 30,
            bottom: 30,
            right: MediaQuery.of(context).size.width / 3),
        color: CustomTheme.primary600,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularImage(
                    NetworkImage(globalState.profileUrl),
                  ),
                ),
                Text(
                  globalState.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              children: primaryOptions.map((item) {
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 21,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            Column(
              children: secondaryOptions.map((item) {
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  onTap: () => item.handleTapEvent(context, item.title),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);

  void handleTapEvent(BuildContext context, String menuTitle) {
    switch (menuTitle) {
      case Constants.SEARCH:
        break;
      case Constants.CONNECT_WITH_GOD:
        break;
      case Constants.FAVORITES:
        break;
      case Constants.HELP_DESK:
        break;
      case Constants.OUR_WEBSITE:
        break;
      case Constants.PRIVACY_POLICY:
        break;
      case Constants.LOG_OUT:
        SharedPref('email').removeKey();
        Navigator.pushReplacement(
          context,
          ScaleRoute(page: Login()),
        );
        break;
      default:
    }
  }
}
