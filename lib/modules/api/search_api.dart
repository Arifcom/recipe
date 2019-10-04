import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/models/search_model.dart';

class SearchApi {
  Future<List<SearchModel>> loadApi(query) async {
    String dataURL = EndPoint.search + query;
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson['meals'] as List)
          .map((p) => SearchModel.fromJson(p))
          .toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}