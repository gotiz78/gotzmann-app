import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/main.dart';

void main() {
  testWidgets('Smoke test: pump app and find Home screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Home text is present.
    expect(find.text('Home'), findsOneWidget);
  });
}
