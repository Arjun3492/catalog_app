import 'dart:convert';
import 'package:catalog_app/pages/product_detail.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:catalog_app/utils/models/products.dart';

const String url = "https://fakestoreapi.com/products";
bool load = true;
fetchProducts() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Products.productList = await List.from(json.decode(response.body))
        .map<Product>((product) => Product.fromMap(product))
        .toList();
    load = false;
    setState() {}
  } else {
    throw Exception('Failed to load data');
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: (!load)
            ? Column(
                children: [
                  "Catalog App".text.bold.xl4.bold.make().py16(),
                  "Trending stuff".text.xl2.semiBold.make().py16(),
                  Expanded(
                      child: ListView.builder(
                          itemCount: Products.productList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                            product:
                                                Products.productList[index])));
                              },
                              title: Column(
                                children: [
                                  Text(
                                    Products.productList[index].title,
                                  ).text.semiBold.make().py12(),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ("${Products.productList[index].category}")
                                            .text
                                            .lightBlue900
                                            .make(),
                                        "\$${Products.productList[index].price.toString()}"
                                            .text
                                            .lightBlue900
                                            .make(),
                                      ])
                                ],
                              ),
                              leading: Image.network(
                                      Products.productList[index].image)
                                  .box
                                  .width(50)
                                  .make(),
                            )
                                .box
                                .roundedSM
                                .shadowMd
                                .p32
                                .color(Colors.white)
                                .make()
                                .py12();
                          }).px16()),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    ));
  }
}
