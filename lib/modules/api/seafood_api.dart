import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/models/seafood_model.dart';

class SeafoodApi {
  Future<List<SeafoodModel>> loadApi() async {
    String dataURL = EndPoint.dessert;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson['meals'] as List)
          .map((p) => SeafoodModel.fromJson(p))
          .toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}