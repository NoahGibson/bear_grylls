import 'package:bear_grylls/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('app should run', (tester) async {
    await tester.pumpWidget(MyApp());
  });

}
