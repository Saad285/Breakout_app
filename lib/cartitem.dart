class CartItem {
  final String name;
  final String imageUrl;
  final int price;

  CartItem({required this.name, required this.imageUrl, required this.price});

  static List<CartItem> items = [];
}
