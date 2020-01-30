import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bear_grylls/main.dart';

void main() {

  testWidgets('app should run', (tester) async {
    await tester.pumpWidget(new MyApp());
  });

}
