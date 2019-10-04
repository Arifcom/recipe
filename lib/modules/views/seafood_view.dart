import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/controllers/detail_controller.dart';
import 'package:recipe/modules/models/seafood_model.dart';

class SeafoodView extends StatefulWidget {
  SeafoodView({Key key}) : super(key: key);

  @override
  _SeafoodViewState createState() => _SeafoodViewState();
}

class _SeafoodViewState extends State<SeafoodView> {
  List<SeafoodModel> seafood = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String dataURL = EndPoint.seafood;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        seafood = (responseJson['meals'] as List)
            .map((p) => SeafoodModel.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: body());
  }

  body() {
    if (seafood.length == 0) {
      return new Center(child: new CircularProgressIndicator());
    } else {
      return Container(
        child: GridView.builder(
            itemCount: seafood.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Hero(
                  tag: 'image' + '${seafood[index].idMeal}',
                  child: Card(
                    color: Colors.blueAccent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailController(
                                idMeal: '${seafood[index].idMeal}',
                                strMeal: '${seafood[index].strMeal}',
                                strMealThumbURL:
                                    '${seafood[index].strMealThumb}',
                                strMealThumb: Image.network(
                                    '${seafood[index].strMealThumb}',
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
                                    '${seafood[index].strMealThumb}',
                                    fit: BoxFit.cover))
                          ]),
                    ),
                  ));
            }),
      );
    }
  }
}
