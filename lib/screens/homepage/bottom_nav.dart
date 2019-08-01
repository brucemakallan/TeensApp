import 'package:flutter/material.dart';

class CustomBottomNav {
  static Widget getBottomNav() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.shopping_basket, color: Colors.grey)),
          BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.shopping_cart, color: Colors.grey)),
          BottomNavigationBarItem(
              title: Text(''), icon: Icon(Icons.person, color: Colors.grey)),
        ],
      );
}
