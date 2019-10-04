import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/controllers/detail_controller.dart';
import 'package:recipe/modules/controllers/search_controller.dart';
import 'package:recipe/modules/models/seafood_model.dart';
import 'package:recipe/modules/api/seafood_api.dart';

import 'package:recipe/config.dart';

class SeafoodView extends StatefulWidget {
  final List<SeafoodModel> seafood;

  SeafoodView(this.seafood, {Key key});

  @override
  _SeafoodViewState createState() => _SeafoodViewState();
}

class _SeafoodViewState extends State<SeafoodView> {
  @override
  void initState() {
    super.initState();
  }

  Widget app_bar_title = new Text(Config.app_string + ' Seafood');
  Icon action_icon = new Icon(Icons.search);
  final t_f_search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title: app_bar_title,
            actions: <Widget>[
              new IconButton(
                icon: action_icon,
                onPressed: () {
                  setState(() {
                    if (this.action_icon.icon == Icons.search) {
                      this.action_icon = new Icon(Icons.close);
                      this.app_bar_title = new TextField(
                        key: Key('search_key'),
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                            prefixIcon:
                            new Icon(Icons.search, color: Colors.white),
                            hintText: "Search...",
                            hintStyle: new TextStyle(color: Colors.white)),
                        onEditingComplete: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchController(
                                    query: t_f_search.text
                                )),
                          );
                        },
                      );
                    } else {
                      this.action_icon = new Icon(Icons.search);
                      this.app_bar_title = new Text(Config.app_string + ' Seafood');
                    }
                  });
                },
              ),
            ]),
        body: body());
  }

  body() {
    return Container(
      child: GridView.builder(
          itemCount: widget.seafood.length == null ? 0 : widget.seafood.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Hero(
                tag: 'image' + '${widget.seafood[index].idMeal}',
                child: Card(
                  color: Colors.blueAccent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailController(
                              idMeal: '${widget.seafood[index].idMeal}',
                              strMeal: '${widget.seafood[index].strMeal}',
                              strMealThumbURL:
                                  '${widget.seafood[index].strMealThumb}',
                              strMealThumb: Image.network(
                                  '${widget.seafood[index].strMealThumb}',
                                  fit: BoxFit.cover),
                            ),
                          ));
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Align(
                              alignment: Alignment(0, 0),
                              child: Image.network(
                                  '${widget.seafood[index].strMealThumb}',
                                  fit: BoxFit.cover))
                        ]),
                  ),
                ));
          }),
    );
  }
}
