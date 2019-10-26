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

    final bn0 = find.byValueKey('bn0');
    final bn1 = find.byValueKey('bn1');
    final bn2 = find.byValueKey('bn2');

    test('Initialization', () async {
      expect(await driver.getText(searchTextField), "Search...");
      await driver.tap(bn0);
      await driver.tap(find.pageBack());
      await driver.tap(bn1);
      await driver.tap(find.pageBack());
      await driver.tap(bn2);
      await driver.tap(find.pageBack());
    });
  });
}