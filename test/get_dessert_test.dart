import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/api/dessert_api.dart';
import 'package:recipe/modules/models/dessert_model.dart';

class MockClient extends Mock implements http.Client {}
main() {
  group('getDessert', () {
    test('Return Future List of Dessert', () async {
      DessertApi da = new DessertApi();
      final client = MockClient();
      http.Response response = await http.get(EndPoint.dessert);
      when(client.get(EndPoint.dessert))
          .thenAnswer((_) async => http.Response(response.body, 200));
      expect(da.loadApi(), isInstanceOf<Future<List<DessertModel>>>());
    });
  });
}