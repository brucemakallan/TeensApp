import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './circular_image.dart';
import './menu_controller.dart';
import '../../utils/assets.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> primaryOptions = [
    MenuItem(Icons.search, 'Search'),
    MenuItem(Icons.power, 'Connect with God'),
    MenuItem(Icons.favorite, 'Favorites'),
  ];
  final List<MenuItem> secondaryOptions = [
    MenuItem(Icons.help, 'Help Desk'),
    MenuItem(Icons.insert_link, 'Our Website'),
    MenuItem(Icons.lock, 'Privacy Policy'),
  ];

  @override
  Widget build(BuildContext context) {
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
                    NetworkImage(imageUrl),
                  ),
                ),
                Text(
                  'Tatiana',
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
                    size: 28,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
}
