import 'package:flutter/material.dart';

import 'package:recipe/modules/controllers/detail_controller.dart';
import 'package:recipe/modules/models/dessert_model.dart';

class DessertView extends StatefulWidget {
  final List<DessertModel> dessert;

  DessertView(this.dessert, {Key key});

  @override
  _DessertViewState createState() => _DessertViewState();
}

class _DessertViewState extends State<DessertView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: body());
  }

  body() {
    return Container(
      child: GridView.builder(
          itemCount: widget.dessert.length == null ? 0 : widget.dessert.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Hero(
                tag: 'image' + '${widget.dessert[index].idMeal}',
                child: Card(
                  color: Colors.blueAccent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailController(
                              idMeal: '${widget.dessert[index].idMeal}',
                              strMeal: '${widget.dessert[index].strMeal}',
                              strMealThumbURL:
                              '${widget.dessert[index].strMealThumb}',
                              strMealThumb: Image.network(
                                  '${widget.dessert[index].strMealThumb}',
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
                                  '${widget.dessert[index].strMealThumb}',
                                  fit: BoxFit.cover))
                        ]),
                  ),
                ));
          }),
    );
  }
}
