import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('Cart', () {
    test('merges same sandwich type+size and ignores bread type', () {
      final cart = Cart();
      final s1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );
      final s2 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.add(s1, quantity: 1);
      cart.add(s2, quantity: 2);

      expect(cart.items.length, equals(1));
      expect(cart.items.first.sandwich.type, equals(SandwichType.veggieDelight));
      expect(cart.items.first.quantity, equals(3));
      expect(cart.totalPrice(), equals(21.0)); // 3 * 7.0
    });

    test('same sandwich different sizes are separate lines', () {
      final cart = Cart();
      final six = Sandwich(type: SandwichType.tunaMelt, isFootlong: false, breadType: BreadType.white);
      final foot = Sandwich(type: SandwichType.tunaMelt, isFootlong: true, breadType: BreadType.white);

      cart.add(six, quantity: 2);
      cart.add(foot, quantity: 1);

      expect(cart.items.length, equals(2));
      expect(cart.totalPrice(), equals(25.0)); // 2*7 + 1*11
    });

    test('calculatePrice delegates to PricingRepository using size + quantity', () {
      final repo = PricingRepository();
      final cart = Cart(pricingRepository: repo);
      final foot = Sandwich(type: SandwichType.meatballMarinara, isFootlong: true, breadType: BreadType.white);

      final expected = repo.calculatePrice(quantity: 3, isFootlong: true);
      expect(cart.calculatePrice(foot, 3), equals(expected));
    });

    test('updateQuantity updates and removes when set to zero or negative', () {
      final cart = Cart();
      final s = Sandwich(type: SandwichType.chickenTeriyaki, isFootlong: true, breadType: BreadType.white);

      cart.add(s, quantity: 2);
      expect(cart.items.first.quantity, equals(2));
      expect(cart.totalPrice(), equals(22.0));

      cart.updateQuantity(s, 1);
      expect(cart.items.first.quantity, equals(1));
      expect(cart.totalPrice(), equals(11.0));

      cart.updateQuantity(s, 0);
      expect(cart.items, isEmpty);
      expect(cart.totalPrice(), equals(0.0));
    });

    test('remove and clear behave as expected', () {
      final cart = Cart();
      final a = Sandwich(type: SandwichType.veggieDelight, isFootlong: false, breadType: BreadType.white);
      final b = Sandwich(type: SandwichType.tunaMelt, isFootlong: true, breadType: BreadType.white);

      cart.add(a, quantity: 1);
      cart.add(b, quantity: 1);
      expect(cart.items.length, equals(2));

      cart.remove(a);
      expect(cart.items.length, equals(1));
      expect(cart.items.first.sandwich.type, equals(SandwichType.tunaMelt));

      cart.clear();
      expect(cart.items, isEmpty);
      expect(cart.totalPrice(), equals(0.0));
    });

    test('items list is unmodifiable', () {
      final cart = Cart();
      final s = Sandwich(type: SandwichType.veggieDelight, isFootlong: false, breadType: BreadType.white);
      cart.add(s, quantity: 1);

      final items = cart.items;
      expect(() => items.add(items.first), throwsUnsupportedError);
    });
  });
}