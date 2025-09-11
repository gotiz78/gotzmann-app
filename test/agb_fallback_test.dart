import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/features/legal_contact/agb_screen.dart';

void main() {
  testWidgets('AGB screen shows markdown fallback on error',
      (WidgetTester tester) async {
    // The test needs assets, so we need to ensure the binding is initialized.
    TestWidgetsFlutterBinding.ensureInitialized();

    // Build our app with the AGB screen in fallback mode.
    await tester.pumpWidget(
      const MaterialApp(
        home: AgbScreen(forceFallback: true),
      ),
    );

    // The FutureBuilder in the fallback needs a frame to resolve.
    await tester.pumpAndSettle();

    // Verify that the Markdown widget is present.
    expect(find.byType(Markdown), findsOneWidget);

    // Also verify that the placeholder text is there
    expect(find.textContaining('Fallback AGB', findRichText: true), findsOneWidget);
  });
}
