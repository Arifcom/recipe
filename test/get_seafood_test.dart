import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:recipe/end_point.dart';
import 'package:recipe/modules/api/seafood_api.dart';
import 'package:recipe/modules/models/seafood_model.dart';

class MockClient extends Mock implements http.Client {}
main() {
  group('getSeafood', () {
    test('Return Future List of Seafood', () async {
      SeafoodApi da = new SeafoodApi();
      final client = MockClient();
      http.Response response = await http.get(EndPoint.seafood);
      when(client.get(EndPoint.seafood))
          .thenAnswer((_) async => http.Response(response.body, 200));
      expect(da.loadApi(), isInstanceOf<Future<List<SeafoodModel>>>());
    });
  });
}