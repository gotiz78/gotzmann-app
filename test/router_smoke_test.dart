import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/main.dart';

void main() {
  testWidgets('Router smoke test: navigates to Instagram',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify that Home is the initial screen.
    expect(find.widgetWithText(AppBar, 'Home'), findsOneWidget);

    // Tap the 'Instagram' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Instagram'), findsOneWidget);
  });
}
