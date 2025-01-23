class FavModel {
  final String status;
  final String id;
  final String category;
  final String name;
  final String image;
  final num price;

  FavModel({
    required this.image,
    required this.status,
    required this.id,
    required this.category,
    required this.name,
    required this.price,
  });

  factory FavModel.fromJson(Map<String, dynamic> jsonData) {
    return FavModel(
      id: jsonData["_id"],
      category: jsonData["category"],
      name: jsonData["name"],
      price: jsonData["price"],
      status: jsonData["status"],
      image: jsonData["image"],
    );
  }
}
