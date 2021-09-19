import 'package:catalog_app/utils/models/products.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/text.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.image,
              height: 400,
              width: 400,
            ),
            Text(product.title).text.bold.xl2.center.make().py32(),
            Text(product.description).text.light.center.make(),
            Text("\$${product.price.toString()}")
                .text
                .bold
                .xl4
                .make()
                .pOnly(top: 20)
          ],
        ).p16(),
      ),
    );
  }
}
