import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/main.dart';

void main() {
  testWidgets('Router smoke test: navigates between tabs',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify that Home is the initial screen.
    expect(find.text('Home'), findsOneWidget);

    // Tap the 'Galerie' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.photo_library));
    await tester.pumpAndSettle();
    expect(find.text('Galerie'), findsOneWidget);

    // Tap the 'Workshops' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.school));
    await tester.pumpAndSettle();
    expect(find.text('Workshops'), findsOneWidget);

    // Tap the 'Buchen' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.book_online));
    await tester.pumpAndSettle();
    expect(find.text('Buchen'), findsOneWidget);

    // Tap the 'Instagram' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pumpAndSettle();
    expect(find.text('Instagram'), findsOneWidget);

    // Tap the 'Kontakt/AGB' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.info));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Kontakt & Rechtliches'), findsOneWidget);

    // Go back to home
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);
  });
}
