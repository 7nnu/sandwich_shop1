import 'package:sandwich_shop/repositories/pricing_repository.dart';

/// A single cart line: sandwich display name, size (footlong or six-inch), and quantity.
class CartItem {
  final String sandwichName;
  final bool isFootlong;
  int quantity;

  CartItem({
    required this.sandwichName,
    required this.isFootlong,
    required this.quantity,
  });
}

/// Shopping cart that holds multiple sandwiches (by name + size) with quantities.
/// Pricing is delegated to the provided PricingRepository. The only thing
/// that affects price is size and quantity.
class Cart {
  final PricingRepository pricingRepository;
  final List<CartItem> _items = [];

  Cart({required this.pricingRepository});

  List<CartItem> get items => List.unmodifiable(_items);

  void add(String sandwichName, {required bool isFootlong, int quantity = 1}) {
    if (quantity <= 0) return;
    final idx = _items.indexWhere(
        (i) => i.sandwichName == sandwichName && i.isFootlong == isFootlong);
    if (idx >= 0) {
      _items[idx].quantity += quantity;
    } else {
      _items.add(CartItem(
          sandwichName: sandwichName, isFootlong: isFootlong, quantity: quantity));
    }
  }

  void remove(String sandwichName, {required bool isFootlong}) {
    _items.removeWhere(
        (i) => i.sandwichName == sandwichName && i.isFootlong == isFootlong);
  }

  void updateQuantity(String sandwichName,
      {required bool isFootlong, required int quantity}) {
    if (quantity <= 0) {
      remove(sandwichName, isFootlong: isFootlong);
      return;
    }
    final idx = _items.indexWhere(
        (i) => i.sandwichName == sandwichName && i.isFootlong == isFootlong);
    if (idx >= 0) {
      _items[idx].quantity = quantity;
    } else {
      _items.add(CartItem(
          sandwichName: sandwichName, isFootlong: isFootlong, quantity: quantity));
    }
  }

  /// Calculate price for a single line using the repository.
  /// Uses repository.calculatePrice({quantity, isFootlong}) which returns
  /// the total price for that quantity and size.
  double calculatePrice(String sandwichName, bool isFootlong, int quantity) {
    if (quantity <= 0) return 0.0;
    return pricingRepository.calculatePrice(
        quantity: quantity, isFootlong: isFootlong);
  }

  /// Total price of all items in the cart.
  double totalPrice() {
    var total = 0.0;
    for (final item in _items) {
      total += calculatePrice(item.sandwichName, item.isFootlong, item.quantity);
    }
    return total;
  }

  void clear() => _items.clear();
}