import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final String description;
  ProductDetailScreen(this.title, this.price, this.imageUrl, this.description);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    /*  final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false, */
    return Scaffold(
      appBar: AppBar(
        // title: Text(loadedProduct.title),
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                //  loadedProduct.imageUrl,
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              //  '\$${loadedProduct.price}',
              '\৳${price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                //   loadedProduct.description,
                description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
