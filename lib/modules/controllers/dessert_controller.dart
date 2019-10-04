import 'package:flutter/material.dart';

import 'package:recipe/modules/controllers/seafood_controller.dart';
import 'package:recipe/modules/controllers/favorite_controller.dart';
import 'package:recipe/modules/views/dessert_view.dart';

import 'package:recipe/config.dart';

class DessertController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      if(index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DessertController()),
        );
      } else if(index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeafoodController()),
        );
      } else if(index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoriteController()),
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(Config.app_string + ' Dessert'),
        ),
        body: DessertView(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_left), title: Text('Dessert')),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_right), title: Text('Seafood')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Favorite'))
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ));
  }
}
