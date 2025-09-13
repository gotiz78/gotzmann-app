import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/features/legal_contact/agb_screen.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  testWidgets('AGB screen shows markdown fallback when forced',
      (WidgetTester tester) async {
    // The test needs assets, so we need to ensure the binding is initialized.
    TestWidgetsFlutterBinding.ensureInitialized();

    // Build our app with the AGB screen in fallback mode.
    await tester.pumpWidget(
      const MaterialApp(
        home: AgbScreen(forceFallback: true),
      ),
    );

    // Let the init() future complete.
    await tester.pumpAndSettle();

    // Verify that the Markdown widget is present.
    expect(find.byType(Markdown), findsOneWidget);
  });
}
