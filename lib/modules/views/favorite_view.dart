import 'package:flutter/material.dart';

import 'package:recipe/modules/controllers/detail_controller.dart';
import 'package:recipe/modules/models/favorite_model.dart';

class FavoriteView extends StatefulWidget {
  final List<FavoriteModel> favorite;

  FavoriteView(this.favorite, {Key key});

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
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
          itemCount: widget.favorite.length == null ? 0 : widget.favorite.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Hero(
                tag: 'image' + '${widget.favorite[index].idMeal}',
                child: Card(
                  color: Colors.blueAccent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailController(
                                idMeal: '${widget.favorite[index].idMeal}',
                                strMealThumb: Image.network(
                                    '${widget.favorite[index].strMealThumb}',
                                    fit: BoxFit.cover))),
                      );
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Align(
                              alignment: Alignment(0, 0),
                              child: Image.network(
                                  '${widget.favorite[index].strMealThumb}',
                                  fit: BoxFit.cover))
                        ]),
                  ),
                ));
          }),
    );
  }
}