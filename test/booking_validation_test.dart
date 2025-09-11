import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/features/booking/booking_screen.dart';

void main() {
  testWidgets('Booking form validation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BookingScreen()));

    // Find the form fields.
    final nameField = find.widgetWithText(TextFormField, 'Name*');
    final emailField = find.widgetWithText(TextFormField, 'E-Mail*');
    final agbCheckbox = find.widgetWithText(CheckboxListTile, 'Ich akzeptiere die AGB*');
    final submitButton = find.widgetWithText(ElevatedButton, 'Anfragen');

    expect(nameField, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(agbCheckbox, findsOneWidget);
    expect(submitButton, findsOneWidget);

    // Try to submit with empty fields.
    await tester.tap(submitButton);
    await tester.pump();

    // Verify that validation errors appear.
    expect(find.text('Name ist ein Pflichtfeld'), findsOneWidget);
    expect(find.text('E-Mail ist ein Pflichtfeld'), findsOneWidget);
    expect(find.text('Bitte die AGB akzeptieren'), findsOneWidget);

    // Enter valid data.
    await tester.enterText(nameField, 'Test User');
    await tester.enterText(emailField, 'test@example.com');
    await tester.tap(agbCheckbox);
    await tester.pump();

    // Try to submit again.
    await tester.tap(submitButton);
    await tester.pump();

    // Verify that validation errors are gone.
    expect(find.text('Name ist ein Pflichtfeld'), findsNothing);
    expect(find.text('E-Mail ist ein Pflichtfeld'), findsNothing);
    expect(find.text('Bitte die AGB akzeptieren'), findsNothing);
  });
}
