import 'package:flutter/material.dart';

import 'package:recipe/modules/controllers/dessert_controller.dart';
import 'package:recipe/modules/controllers/seafood_controller.dart';
import 'package:recipe/modules/views/favorite_view.dart';
import 'package:recipe/modules/sql/favorite_sql.dart';

import 'package:recipe/config.dart';

class FavoriteController extends StatelessWidget {
  var db = new FavoriteSQL();

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

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
          title: Text(Config.app_string + ' Favorite'),
        ),
        body: FutureBuilder(
          future: db.getFavorite(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            var data = snapshot.data;
            return snapshot.hasData
                ? FavoriteView(data)
                : Center(
              child: Text("Tidak Ada Data"),
            );
          },
        ),
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
          key: Key('bn2'),
        ));
  }
}
