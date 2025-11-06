import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';
import 'package:sandwich_shop/repositories/order_repository.dart';

void main() {
  group('PricingRepository', () {
    test('totalPrice returns 0 when quantity is 0', () {
      final pricing = PricingRepository();
      expect(pricing.totalPrice(isFootLong: true, quantity: 0), 0.0);
    });

    test('totalPrice calculates correct price for one footlong', () {
      final pricing = PricingRepository();
      final order = OrderRepository(maxQuantity: 5);
      order.increment();
      final total = pricing.totalPrice(isFootLong: true, quantity: order.quantity);
      expect(total, 11.0);
    });

    test('totalPrice calculates correct price for one six-inch', () {
      final pricing = PricingRepository();
      final order = OrderRepository(maxQuantity: 5);
      order.increment();
      final total = pricing.totalPrice(isFootLong: false, quantity: order.quantity);
      expect(total, 7.0);
    });

    test('totalPrice calculates correct price for multiple sandwiches', () {
      final pricing = PricingRepository();
      final order = OrderRepository(maxQuantity: 5);
      order.increment();
      order.increment();
      final totalFootlong = pricing.totalPrice(isFootLong: true, quantity: order.quantity);
      final totalSixInch = pricing.totalPrice(isFootLong: false, quantity: order.quantity);
      expect(totalFootlong, 22.0);
      expect(totalSixInch, 14.0);
    });

    test('totalPrice does not go negative', () {
      final pricing = PricingRepository();
      final order = OrderRepository(maxQuantity: 5);
      final total = pricing.totalPrice(isFootLong: true, quantity: order.quantity);
      expect(total, greaterThanOrEqualTo(0.0));
    });
  });
}
