import 'package:flutter_test/flutter_test.dart';
import 'package:gotzmann_app/config/pricing.dart';

void main() {
  test('member discount applies 20%', () {
    expect(priceWithDiscount(100), closeTo(80, 0.001));
    expect(priceWithDiscount(250), closeTo(200, 0.001));
  });
}
