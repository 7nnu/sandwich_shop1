import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

String enumName(Object e) => e.toString().split('.').last;

void main() {
  group('Sandwich.name', () {
    test('veggieDelight maps to "Veggie Delight"', () {
      final s = Sandwich(type: SandwichType.veggieDelight, isFootlong: false, breadType: BreadType.white);
      expect(s.name, equals('Veggie Delight'));
    });

    test('chickenTeriyaki maps to "Chicken Teriyaki"', () {
      final s = Sandwich(type: SandwichType.chickenTeriyaki, isFootlong: true, breadType: BreadType.wheat);
      expect(s.name, equals('Chicken Teriyaki'));
    });

    test('tunaMelt maps to "Tuna Melt"', () {
      final s = Sandwich(type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.wholemeal);
      expect(s.name, equals('Tuna Melt'));
    });

    test('meatballMarinara maps to "Meatball Marinara"', () {
      final s = Sandwich(type: SandwichType.meatballMarinara, isFootlong: true, breadType: BreadType.white);
      expect(s.name, equals('Meatball Marinara'));
    });
  });

  group('Sandwich.image', () {
    test('uses enum name and six_inch when not footlong', () {
      final s = Sandwich(type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.wheat);
      expect(s.image, equals('assets/images/sandwiches/${enumName(SandwichType.tunaMelt)}_six_inch.png'));
    });

    test('uses enum name and footlong when footlong', () {
      final s = Sandwich(type: SandwichType.meatballMarinara, isFootlong: true, breadType: BreadType.wholemeal);
      expect(s.image, equals('assets/images/sandwiches/${enumName(SandwichType.meatballMarinara)}_footlong.png'));
    });

    test('breadType does not affect image path', () {
      final s1 = Sandwich(type: SandwichType.chickenTeriyaki, isFootlong: true, breadType: BreadType.white);
      final s2 = Sandwich(type: SandwichType.chickenTeriyaki, isFootlong: true, breadType: BreadType.wheat);
      expect(s1.image, equals(s2.image));
    });

    test('all sandwich types produce expected image filenames for both sizes', () {
      for (final type in SandwichType.values) {
        final six = Sandwich(type: type, isFootlong: false, breadType: BreadType.white);
        final foot = Sandwich(type: type, isFootlong: true, breadType: BreadType.white);

        expect(six.image, equals('assets/images/sandwiches/${enumName(type)}_six_inch.png'));
        expect(foot.image, equals('assets/images/sandwiches/${enumName(type)}_footlong.png'));
      }
    });
  });
}