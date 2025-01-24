class CartModel {
  final String status;
  final String id;
  final String category;
  final String name;
  final String image;
  final String description;
  final num price;

  CartModel({
    required this.description,
    required this.image,
    required this.status,
    required this.id,
    required this.category,
    required this.name,
    required this.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
      id: jsonData["_id"],
      category: jsonData["category"],
      name: jsonData["name"],
      price: jsonData["price"],
      status: jsonData["status"],
      image: jsonData["image"],
      description: jsonData["description"],
    );
  }
}
