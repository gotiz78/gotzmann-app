import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/features/settings/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Settings screen shows a switch', (WidgetTester tester) async {
    // We need to mock the shared_preferences plugin.
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      const MaterialApp(
        home: SettingsScreen(),
      ),
    );

    // Let the init() future complete.
    await tester.pumpAndSettle();

    // Verify that a SwitchListTile is present.
    expect(find.byType(SwitchListTile), findsOneWidget);
  });
}
