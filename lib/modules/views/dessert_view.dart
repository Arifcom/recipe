import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/controllers/detail_controller.dart';
import 'package:recipe/modules/models/dessert_model.dart';

class DessertView extends StatefulWidget {
  DessertView({Key key}) : super(key: key);

  @override
  _DessertViewState createState() => _DessertViewState();
}

class _DessertViewState extends State<DessertView> {
  List<DessertModel> dessert = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String dataURL = EndPoint.dessert;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        dessert = (responseJson['meals'] as List)
            .map((p) => DessertModel.fromJson(p))
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
    if (dessert.length == 0) {
      return new Center(child: new CircularProgressIndicator());
    } else {
      return Container(
        child: GridView.builder(
            itemCount: dessert.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Hero(
                  tag: 'image' + '${dessert[index].idMeal}',
                  child: Card(
                    color: Colors.blueAccent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailController(
                                    idMeal: '${dessert[index].idMeal}',
                                    strMeal: '${dessert[index].strMeal}',
                                    strMealThumbURL:
                                        '${dessert[index].strMealThumb}',
                                    strMealThumb: Image.network(
                                        '${dessert[index].strMealThumb}',
                                        fit: BoxFit.cover),
                                  )),
                        );
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment(0, 0),
                                child: Image.network(
                                    '${dessert[index].strMealThumb}',
                                    fit: BoxFit.cover))
                          ]),
                    ),
                  ));
            }),
      );
    }
  }
}
