// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Bear Grylls', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    //final counterTextFinder = find.byValueKey('counter');
    //final buttonFinder = find.byValueKey('increment');
    final takeAPicTextFinder = find.byValueKey('takeAPicTest');
    final bearGryllsTextFinder = find.byValueKey('BearGryllsTest1');
    final enterADescTextFinder = find.byValueKey('enterADescTest');
    final detailsTextFinder = find.byValueKey('details');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Bear Grylls Text', () async {
      expect(await driver.getText(bearGryllsTextFinder), "Bear Grylls");
    });

    test('Take a Picture Text', () async {
      expect(await driver.getText(takeAPicTextFinder), "Take a Picture");
    });

   /* test('Enter a Description Test', () async {
      //await driver.runUnsynchronized(() async {
        expect(await driver.getText(enterADescTextFinder), "Enter a Description");
      });
    //});

    test('Details Test', () async {
      //await driver.runUnsynchronized(() async {
      expect(await driver.getText(detailsTextFinder), "Details");
      });
    //});*/

/*    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });*/

//    test('increments the counter', () async {
////      // First, tap the button.
////      await driver.tap(buttonFinder);
////
////      // Then, verify the counter text is incremented by 1.
////      expect(await driver.getText(counterTextFinder), "1");
////    });
  });
}