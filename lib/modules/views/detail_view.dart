import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/models/detail_model.dart';

class DetailView extends StatefulWidget {
  final String idMeal;
  final String strMeal;
  final Image strMealThumb;

  DetailView({Key key, this.idMeal, this.strMeal, this.strMealThumb})
      : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  List<DetailModel> detail = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String dataURL = EndPoint.detail + widget.idMeal;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        detail = (responseJson['meals'] as List)
            .map((p) => DetailModel.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            padding: EdgeInsets.all(0.0),
            child: Align(
                alignment: Alignment(0, -1),
                child: SingleChildScrollView(
                    child: Card(
                        margin: EdgeInsets.all(0.0),
                        elevation: 0.0,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Hero(
                                  tag: 'image' + widget.idMeal,
                                  child: Container(child: widget.strMealThumb)),
                              body()
                            ]))))));
  }

  body() {
    if (detail.length == 0) {
      return Container(
          padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
          child: CircularProgressIndicator());
    } else {
      return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20),
                child: Text('${detail[0].strMeal}',
                    style: TextStyle(fontSize: 25))),
            Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 2.5),
                child: Text('Instructions', style: TextStyle(fontSize: 20))),
            Container(
                margin: EdgeInsets.all(20),
                child: Text('${detail[0].strInstructions}',
                    style: TextStyle(fontSize: 15))),
            Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 2.5),
                child: Text('Ingredients', style: TextStyle(fontSize: 20))),
            Container(
                margin: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          '${detail[0].strIngredient1} : ${detail[0].strMeasure1}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient2} : ${detail[0].strMeasure2}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient3} : ${detail[0].strMeasure3}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient4} : ${detail[0].strMeasure4}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient5} : ${detail[0].strMeasure5}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient6} : ${detail[0].strMeasure6}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient7} : ${detail[0].strMeasure7}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient8} : ${detail[0].strMeasure8}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient9} : ${detail[0].strMeasure9}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient10} : ${detail[0].strMeasure10}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient11} : ${detail[0].strMeasure11}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient12} : ${detail[0].strMeasure12}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient13} : ${detail[0].strMeasure13}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient14} : ${detail[0].strMeasure14}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient15} : ${detail[0].strMeasure15}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient16} : ${detail[0].strMeasure16}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient17} : ${detail[0].strMeasure17}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient18} : ${detail[0].strMeasure18}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient19} : ${detail[0].strMeasure19}',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '${detail[0].strIngredient20} : ${detail[0].strMeasure20}',
                          style: TextStyle(fontSize: 15)),
                    ]))
          ]);
    }
  }
}
