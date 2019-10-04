import 'package:flutter/material.dart';

import 'package:recipe/modules/controllers/dessert_controller.dart';
import 'package:recipe/modules/controllers/favorite_controller.dart';
import 'package:recipe/modules/views/seafood_view.dart';
import 'package:recipe/modules/api/seafood_api.dart';

class SeafoodController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SeafoodApi da = new SeafoodApi();
    int _selectedIndex = 1;

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
        body: FutureBuilder(
          future: da.loadApi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            var data = snapshot.data;
            return snapshot.hasData
                ? SeafoodView(data)
                : Center(child: new CircularProgressIndicator());
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_left), title: Text('Seafood')),
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
