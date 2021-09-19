import 'dart:convert';

class Products {
  static List<Product> productList = [];
}

class Product {
  final int id;
  final String title;
  final String category;
  final num price;
  final String description;
  final String image;
  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
  });

  Product copyWith({
    int? id,
    String? title,
    String? category,
    num? price,
    String? description,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'description': description,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      price: map['price'],
      description: map['description'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, category: $category, price: $price, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.title == title &&
        other.category == category &&
        other.price == price &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        price.hashCode ^
        description.hashCode ^
        image.hashCode;
  }
}
