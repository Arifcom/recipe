import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/models/dessert_model.dart';

class DessertApi {
  Future<DessertModel> loadData() async {
    String dataURL = EndPoint.dessert;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseJson;
    } else {
      throw Exception('Failed to load photos');
    }
  }
}