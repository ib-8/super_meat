class Category {
  final String name;
  final String image;

  const Category({
    required this.name,
    required this.image,
  });
}

class Product {
  final String name;
  final String image;
  final String details;
  final int kcal;
  final double priceHalfKilo;

  const Product({
    required this.name,
    required this.image,
    required this.details,
    required this.kcal,
    required this.priceHalfKilo,
  });
}

class CartItem {
  Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}

class Cart {
  static List<CartItem> items = [];
}
