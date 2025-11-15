// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String id;
  String name;
  int user;
  String username;
  String brand;
  int price;
  int stock;
  int sold;
  String description;
  String thumbnail;
  String category;
  bool isFeatured;

  Product({
    required this.id,
    required this.name,
    required this.user,
    required this.username,
    required this.brand,
    required this.price,
    required this.stock,
    required this.sold,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    user: json["user"],
    username: json["username"],
    brand: json["brand"],
    price: json["price"],
    stock: json["stock"],
    sold: json["sold"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    category: json["category"],
    isFeatured: json["is_featured"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user": user,
    "username": username,
    "brand": brand,
    "price": price,
    "stock": stock,
    "sold": sold,
    "description": description,
    "thumbnail": thumbnail,
    "category": category,
    "is_featured": isFeatured,
  };
}
