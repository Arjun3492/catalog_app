// import 'dart:convert';
// import 'package:catalog_app/utils/models/products.dart';
// import 'package:http/http.dart' as http;

// final String url = "https://fakestoreapi.com/products";
// Future<List<Product>> fetchProducts() async {
//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     Products.productList = List.from(json.decode(response.body))
//         .map<Product>((product) => Product.fromJson(product))
//         .toList();
//     return Products.productList;
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
