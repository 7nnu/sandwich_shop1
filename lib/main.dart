import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class StyledButton extends StatelessWidget {
  final VoidCallback ?onPressed;
  final String text;
  final bool buttonEnabled;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonEnabled ?  Colors.red : Colors.grey,
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  bool _isFootlong = true;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              _isFootlong ? 'Footlong' : 'Six-inch',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: StyledButton(
                    onPressed: _increaseQuantity,
                    text: 'Add',
                    buttonEnabled: _quantity < widget.maxQuantity,
                  ),
                ),
                const SizedBox(width: 14),
                SizedBox(
                  child: StyledButton(
                    onPressed: _decreaseQuantity,
                    text: 'Remove',
                    buttonEnabled: _quantity > 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_isFootlong ? 'Footlong' : 'Six-inch'),
                Switch(
                  value: _isFootlong,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isFootlong = newValue;
                    });
                  },
                  activeThumbColor: Colors.white,
                  activeTrackColor: Colors.red,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}
