import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('Cart', () {
    test('adding items and computing totalPrice (size-only pricing)', () {
      final repo = PricingRepository();
      final cart = Cart(pricingRepository: repo);

      // 2 six-inch (7.00 each) and 1 footlong (11.00)
      cart.add('Veggie Delight', isFootlong: false, quantity: 2);
      cart.add('Chicken Teriyaki', isFootlong: true, quantity: 1);

      // expected: 2 * 7 + 1 * 11 = 25.0
      expect(cart.totalPrice(), equals(25.0));
      expect(cart.items.length, equals(2));
    });

    test('adding same name+size merges quantities', () {
      final repo = PricingRepository();
      final cart = Cart(pricingRepository: repo);

      cart.add('Tuna Melt', isFootlong: false, quantity: 1);
      cart.add('Tuna Melt', isFootlong: false, quantity: 2);

      expect(cart.items.length, equals(1));
      expect(cart.items.first.quantity, equals(3));
      // 3 six-inch -> 3 * 7 = 21
      expect(cart.totalPrice(), equals(21.0));
    });

    test('updateQuantity changes total and removing by setting 0', () {
      final repo = PricingRepository();
      final cart = Cart(pricingRepository: repo);

      cart.add('Meatball Marinara', isFootlong: true, quantity: 2);
      expect(cart.totalPrice(), equals(22.0)); // 2 * 11

      cart.updateQuantity('Meatball Marinara', isFootlong: true, quantity: 1);
      expect(cart.totalPrice(), equals(11.0));

      // setting to 0 should remove the line
      cart.updateQuantity('Meatball Marinara', isFootlong: true, quantity: 0);
      expect(cart.items, isEmpty);
      expect(cart.totalPrice(), equals(0.0));
    });

    test('remove and clear work as expected', () {
      final repo = PricingRepository();
      final cart = Cart(pricingRepository: repo);

      cart.add('A', isFootlong: false, quantity: 1);
      cart.add('B', isFootlong: true, quantity: 1);
      expect(cart.items.length, equals(2));

      cart.remove('A', isFootlong: false);
      expect(cart.items.length, equals(1));

      cart.clear();
      expect(cart.items, isEmpty);
      expect(cart.totalPrice(), equals(0.0));
    });

    test('items list is unmodifiable', () {
      final repo = PricingRepository();
      final cart = Cart(pricingRepository: repo);

      cart.add('X', isFootlong: false, quantity: 1);
      final items = cart.items;
      expect(() => items.add(CartItem(sandwichName: 'Y', isFootlong: true, quantity: 1)), throwsA(isA<UnsupportedError>()));
    });
  });
}