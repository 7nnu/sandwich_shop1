class PricingRepository {
  final double sixInchPrice = 7.0;
  final double footlongPrice = 11.0;

    double sizePrice({required bool isFootLong}) {
      return isFootLong ? footlongPrice : sixInchPrice;
    }

    double totalPrice({required bool isFootLong, required int quantity}) {
      return sizePrice(isFootLong: isFootLong) * quantity;
    }
  }