import 'package:flutter/material.dart';

import 'package:recipe/modules/controllers/seafood_controller.dart';
import 'package:recipe/modules/controllers/favorite_controller.dart';
import 'package:recipe/modules/views/search_view.dart';
import 'package:recipe/modules/api/search_api.dart';

class SearchController extends StatelessWidget {
  final String query;

  SearchController({Key key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchApi sa = new SearchApi();

    void _onItemTapped(int index) {
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchController()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeafoodController()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoriteController()),
        );
      }
    }

    return Scaffold(
        body: FutureBuilder(
          future: sa.loadApi(this.query),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            var data = snapshot.data;
            return snapshot.hasData
                ? SearchView(data)
                : Center(child: new CircularProgressIndicator());
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
          fixedColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ));
  }
}
