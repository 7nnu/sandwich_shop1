import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';

void main() {
  group('CheckoutScreen', () {
    late Cart cart;

    setUp(() {
      cart = Cart();
      cart.add(
        Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        ),
        quantity: 2,
      );
      cart.add(
        Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: false,
          breadType: BreadType.wheat,
        ),
        quantity: 1,
      );
    });

    testWidgets('renders order summary correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CheckoutScreen(cart: cart),
        ),
      );

      expect(find.text('Order Summary'), findsOneWidget);
      expect(find.text('2x Veggie Delight'), findsOneWidget);
      expect(find.text('1x Chicken Teriyaki'), findsOneWidget);
      expect(find.text('Total:'), findsOneWidget);
      expect(find.textContaining('£'), findsWidgets);
    });

    testWidgets('displays processing state when payment is confirmed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CheckoutScreen(cart: cart),
        ),
      );

      final confirmButton = find.text('Confirm Payment');
      expect(confirmButton, findsOneWidget);

      await tester.tap(confirmButton);
      await tester.pump(); // Start the processing state

      expect(find.text('Processing payment...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump(const Duration(seconds: 2)); // Simulate delay
      expect(find.text('Processing payment...'), findsNothing);
    });

    testWidgets('pops with order confirmation on successful payment',
        (WidgetTester tester) async {
      bool didPop = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Navigator(
            onPopPage: (route, result) {
              didPop = true;
              expect(result, isA<Map>());
              expect(result['orderId'], startsWith('ORD'));
              expect(result['totalAmount'], cart.totalPrice);
              expect(result['itemCount'], cart.countOfItems);
              return route.didPop(result);
            },
            pages: [
              MaterialPage(
                child: CheckoutScreen(cart: cart),
              ),
            ],
          ),
        ),
      );

      final confirmButton = find.text('Confirm Payment');
      await tester.tap(confirmButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(didPop, isTrue);
    });
  });
}
