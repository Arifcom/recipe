import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Recipe', () {
    final searchTextField = find.byValueKey('search_key');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Initialization', () async {
      expect(await driver.getText(searchTextField), "Search...");
    });
  });
}