import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/models/detail_model.dart';

class DetailApi {
  Future<List<DetailModel>> loadApi(id) async {
    String dataURL = EndPoint.detail + id;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson['meals'] as List)
          .map((p) => DetailModel.fromJson(p))
          .toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}