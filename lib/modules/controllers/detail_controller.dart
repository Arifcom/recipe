import 'package:flutter/material.dart';

import 'package:recipe/modules/views/detail_view.dart';
import 'package:recipe/modules/sql/favorite_sql.dart';
import 'package:recipe/modules/models/favorite_model.dart';

import 'package:recipe/config.dart';

class DetailController extends StatefulWidget {
  final String idMeal;
  final Image strMealThumb;
  final String strMeal;
  final String strMealThumbURL;

  DetailController(
      {Key key,
        this.idMeal,
        this.strMealThumb,
        this.strMeal,
        this.strMealThumbURL})
      : super(key: key);

  @override
  _DetailControllerState createState() => _DetailControllerState();
}

class _DetailControllerState extends State<DetailController> {
  var db = new FavoriteSQL();
  Color iconColor;

  Widget build(BuildContext context) {
    getFavoriteByIdMeal();
    return Scaffold(
      appBar: AppBar(
          title: Text(Config.app_string + ' Detail'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star, color: iconColor),
              onPressed: () {
                addRecord();
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: DetailView(idMeal: widget.idMeal, strMealThumb: widget.strMealThumb),
    );
  }

  Future getFavoriteByIdMeal() async {
    List<FavoriteModel> favoriteByIdMeal = await db.getFavoriteByIdMeal(widget.idMeal);
    if(favoriteByIdMeal.length == 0) {
      setState(() {
        iconColor = Colors.white;
      });
    } else {
      setState(() {
        iconColor = Colors.yellow;
      });
    }
  }

  Future addRecord() async {
    var now = DateTime.now();

    String dateNow =
        "${now.day}/${now.month}/${now.year}, ${now.hour}:${now.minute}";

    var favorite =
    FavoriteModel(widget.idMeal, widget.strMeal, widget.strMealThumbURL, dateNow, dateNow);

    if(iconColor == Colors.white) {
      await db.saveFavorite(favorite);
      print("saved");

      setState(() {
        iconColor = Colors.yellow;
      });
    } else if(iconColor == Colors.yellow) {
      db.deleteFavorite(widget.idMeal);
      print("deleted");

      setState(() {
        iconColor = Colors.white;
      });
    }
  }
}
