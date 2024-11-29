class CartItem {
  final String name;
  final int price;
  final String image;
  int quantity;
  final int calories;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.calories,
  });
}
