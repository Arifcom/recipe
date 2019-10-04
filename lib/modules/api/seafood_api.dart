import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/models/seafood_model.dart';

class SeafoodApi {
  Future<SeafoodModel> loadData() async {
    String dataURL = EndPoint.seafood;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseJson;
    } else {
      throw Exception('Failed to load photos');
    }
  }
}