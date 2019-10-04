import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/models/dessert_model.dart';
import 'package:recipe/modules/api/dessert_api.dart';

class MockClient extends Mock implements http.Client {}
main() {
  DessertApi da = new DessertApi();
  String dataURL = EndPoint.dessert;
  group('loadData', () {
    test('Load data berhasil', () async {
      final client = MockClient();
      when(client.get(dataURL))
          .thenAnswer((_) async => http.Response('', 200));
      expect(await da.loadData(), isInstanceOf<DessertModel>());
    });
  });
}