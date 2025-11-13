// ...existing code...
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

/// A single cart line: sandwich (type + size + bread) and quantity.
class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem({required this.sandwich, required this.quantity});
}

/// Shopping cart that holds multiple Sandwiches (by type + size) with quantities.
///
/// This implementation provides a default constructor `Cart()` (used by main.dart)
/// and uses PricingRepository.calculatePrice({required int quantity, required bool isFootlong})
/// to compute prices. Per requirements, price depends only on size and quantity.
class Cart {
  final PricingRepository _pricingRepository;

  // Internal list of cart lines
  final List<CartItem> _items = [];

  // Default constructor used by main.dart
  Cart({PricingRepository? pricingRepository})
      : _pricingRepository = pricingRepository ?? PricingRepository();

  List<CartItem> get items => List.unmodifiable(_items);

  /// Add a sandwich to the cart. Merges with an existing line if the same
  /// sandwich type and size (isFootlong) exist.
  void add(Sandwich sandwich, {int quantity = 1}) {
    if (quantity <= 0) return;
    final idx = _items.indexWhere((item) =>
        item.sandwich.type == sandwich.type &&
        item.sandwich.isFootlong == sandwich.isFootlong);
    if (idx >= 0) {
      _items[idx].quantity += quantity;
    } else {
      _items.add(CartItem(sandwich: sandwich, quantity: quantity));
    }
  }

  /// Remove any lines that match the sandwich by type + size.
  void remove(Sandwich sandwich) {
    _items.removeWhere((item) =>
        item.sandwich.type == sandwich.type &&
        item.sandwich.isFootlong == sandwich.isFootlong);
  }

  /// Update quantity for a matching line. If quantity <= 0 the line is removed.
  void updateQuantity(Sandwich sandwich, int quantity) {
    if (quantity <= 0) {
      remove(sandwich);
      return;
    }
    final idx = _items.indexWhere((item) =>
        item.sandwich.type == sandwich.type &&
        item.sandwich.isFootlong == sandwich.isFootlong);
    if (idx >= 0) {
      _items[idx].quantity = quantity;
    } else {
      _items.add(CartItem(sandwich: sandwich, quantity: quantity));
    }
  }

  /// Calculate price for a single line by delegating to PricingRepository.
  /// Uses repository.calculatePrice({quantity, isFootlong}).
  double calculatePrice(Sandwich sandwich, int quantity) {
    if (quantity <= 0) return 0.0;
    return _pricingRepository.calculatePrice(
      quantity: quantity,
      isFootlong: sandwich.isFootlong,
    );
  }

  /// Total price of all items in the cart.
  double totalPrice() {
    var total = 0.0;
    for (final item in _items) {
      total += calculatePrice(item.sandwich, item.quantity);
    }
    return total;
  }

  void clear() => _items.clear();
}
// ...existing code...
```// filepath: c:\Users\tmhoo\Downloads\test\sandwich_shop\lib\models\cart.dart
// ...existing code...
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

/// A single cart line: sandwich (type + size + bread) and quantity.
class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem({required this.sandwich, required this.quantity});
}

/// Shopping cart that holds multiple Sandwiches (by type + size) with quantities.
///
/// This implementation provides a default constructor `Cart()` (used by main.dart)
/// and uses PricingRepository.calculatePrice({required int quantity, required bool isFootlong})
/// to compute prices. Per requirements, price depends only on size and quantity.
class Cart {
  final PricingRepository _pricingRepository;

  // Internal list of cart lines
  final List<CartItem> _items = [];

  // Default constructor used by main.dart
  Cart({PricingRepository? pricingRepository})
      : _pricingRepository = pricingRepository ?? PricingRepository();

  List<CartItem> get items => List.unmodifiable(_items);

  /// Add a sandwich to the cart. Merges with an existing line if the same
  /// sandwich type and size (isFootlong) exist.
  void add(Sandwich sandwich, {int quantity = 1}) {
    if (quantity <= 0) return;
    final idx = _items.indexWhere((item) =>
        item.sandwich.type == sandwich.type &&
        item.sandwich.isFootlong == sandwich.isFootlong);
    if (idx >= 0) {
      _items[idx].quantity += quantity;
    } else {
      _items.add(CartItem(sandwich: sandwich, quantity: quantity));
    }
  }

  /// Remove any lines that match the sandwich by type + size.
  void remove(Sandwich sandwich) {
    _items.removeWhere((item) =>
        item.sandwich.type == sandwich.type &&
        item.sandwich.isFootlong == sandwich.isFootlong);
  }

  /// Update quantity for a matching line. If quantity <= 0 the line is removed.
  void updateQuantity(Sandwich sandwich, int quantity) {
    if (quantity <= 0) {
      remove(sandwich);
      return;
    }
    final idx = _items.indexWhere((item) =>
        item.sandwich.type == sandwich.type &&
        item.sandwich.isFootlong == sandwich.isFootlong);
    if (idx >= 0) {
      _items[idx].quantity = quantity;
    } else {
      _items.add(CartItem(sandwich: sandwich, quantity: quantity));
    }
  }

  /// Calculate price for a single line by delegating to PricingRepository.
  /// Uses repository.calculatePrice({quantity, isFootlong}).
  double calculatePrice(Sandwich sandwich, int quantity) {
    if (quantity <= 0) return 0.0;
    return _pricingRepository.calculatePrice(
      quantity: quantity,
      isFootlong: sandwich.isFootlong,
    );
  }

  /// Total price of all items in the cart.
  double totalPrice() {
    var total = 0.0;
    for (final item in _items) {
      total += calculatePrice(item.sandwich, item.quantity);
    }
    return total;
  }

  void clear() => _items.clear();
}
// ...existing code...