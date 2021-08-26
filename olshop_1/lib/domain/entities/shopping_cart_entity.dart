class ShoppingCartEntity {
  String id;
  String productName;
  String seller;
  String location;
  String imageUrl;
  int quantity;
  double price;
  String note;

  ShoppingCartEntity({
    required this.id,
    required this.productName,
    required this.seller,
    required this.location,
    required this.imageUrl,
    required this.quantity,
    required this.price,
    required this.note,
  });
}
