import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 1920.0,
          height: 400.0,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OrderItemDisplay(3, 'BLT'),
              OrderItemDisplay(5, 'Club'),
              OrderItemDisplay(2, 'Veggie'),
            ],
          ),
        )),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text( 
      '$quantity $itemType sandwich(es): ${'🥪' * quantity}',
      style: const TextStyle(fontSize: 35, color: Colors.green, fontWeight: FontWeight.bold),
    );
      
      
  }
}

void main() {
  runApp(const App());
}
