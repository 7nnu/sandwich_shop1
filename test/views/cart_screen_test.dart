import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart';

void main() {
  group('CartScreen', () {
    late Cart cart;
    late Sandwich sandwich1;
    late Sandwich sandwich2;

    setUp(() {
      cart = Cart();
      sandwich1 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.white,
      );
      sandwich2 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );

      cart.add(sandwich1, quantity: 2);
      cart.add(sandwich2, quantity: 1);
    });

    testWidgets('displays cart items with correct quantities', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      expect(find.text('Chicken Teriyaki'), findsOneWidget);
      expect(find.text('Quantity: 2'), findsOneWidget);
      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Quantity: 1'), findsOneWidget);
    });

    testWidgets('increases quantity when "+" button is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      final addButton = find.widgetWithIcon(IconButton, Icons.add).first;
      await tester.tap(addButton);
      await tester.pump();

      expect(find.text('Quantity: 3'), findsOneWidget);
    });

    testWidgets('removes item when quantity drops below 1', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      final removeButton = find.widgetWithIcon(IconButton, Icons.remove).first;
      await tester.tap(removeButton);
      await tester.tap(removeButton); // Reduce quantity to 0
      await tester.pump();

      expect(find.text('Chicken Teriyaki'), findsNothing);
    });

    testWidgets('removes item when "Remove" button is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      final deleteButton = find.widgetWithIcon(IconButton, Icons.delete).first;
      await tester.tap(deleteButton);
      await tester.pump();

      expect(find.text('Chicken Teriyaki'), findsNothing);
    });

    testWidgets('updates total price correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      expect(find.textContaining('\£'), findsOneWidget); // Total price is displayed
    });

    testWidgets('displays empty cart message when cart is empty', (WidgetTester tester) async {
      cart.clear();
      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

      expect(find.text('Your cart is empty.'), findsOneWidget);
    });
  });
}
