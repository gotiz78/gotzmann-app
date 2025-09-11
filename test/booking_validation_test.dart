import 'package:flutter_test/flutter_test.dart';

class BookingValidator {
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name ist ein Pflichtfeld';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'E-Mail ist ein Pflichtfeld';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Bitte eine gültige E-Mail-Adresse eingeben';
    }
    return null;
  }

  String? validateAgb(bool? value) {
    if (value == null || !value) {
      return 'Bitte die AGB akzeptieren';
    }
    return null;
  }
}

void main() {
  group('BookingValidator', () {
    final validator = BookingValidator();

    group('Name', () {
      test('is invalid if null', () {
        expect(validator.validateName(null), isNotNull);
      });
      test('is invalid if empty', () {
        expect(validator.validateName(''), isNotNull);
      });
      test('is invalid if whitespace', () {
        expect(validator.validateName('  '), isNotNull);
      });
      test('is valid if not empty', () {
        expect(validator.validateName('John Doe'), isNull);
      });
    });

    group('Email', () {
      test('is invalid if null', () {
        expect(validator.validateEmail(null), isNotNull);
      });
      test('is invalid if empty', () {
        expect(validator.validateEmail(''), isNotNull);
      });
      test('is invalid if malformed', () {
        expect(validator.validateEmail('invalid-email'), isNotNull);
        expect(validator.validateEmail('test@'), isNotNull);
        expect(validator.validateEmail('test@example'), isNotNull);
      });
      test('is valid if well-formed', () {
        expect(validator.validateEmail('test@example.com'), isNull);
      });
    });

    group('AGB Checkbox', () {
      test('is invalid if null', () {
        expect(validator.validateAgb(null), isNotNull);
      });
      test('is invalid if false', () {
        expect(validator.validateAgb(false), isNotNull);
      });
      test('is valid if true', () {
        expect(validator.validateAgb(true), isNull);
      });
    });
  });
}
