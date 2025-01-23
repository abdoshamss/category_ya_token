class CartAllModel {
  final String status;
  final String id;
  final String category;
  final String name;
  final String image;
  final num price;
  final num totalPrice;
  final num quantity;

  CartAllModel({
    required this.totalPrice,
    required this.quantity,
    required this.image,
    required this.status,
    required this.id,
    required this.category,
    required this.name,
    required this.price,
  });

  factory CartAllModel.fromJson(Map<String, dynamic> jsonData) {
    return CartAllModel(
      totalPrice: jsonData["totalPrice"],
      quantity: jsonData["quantity"],
      id: jsonData["_id"],
      category: jsonData["category"],
      name: jsonData["name"],
      price: jsonData["price"],
      status: jsonData["status"],
      image: jsonData["image"],
    );
  }
}
