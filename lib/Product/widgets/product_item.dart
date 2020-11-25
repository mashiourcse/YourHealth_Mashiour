import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductItem(this.id, this.title, this.imageUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) =>
                    ProductDetailScreen(title, price, imageUrl, description),
              ),
            );
            /*    Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              //  arguments: product.id,
              arguments: id,
            ); */
          },
          child: imageUrl == null || imageUrl == ""
              ? Container()
              : Image.network(
                  // product.imageUrl,
                  imageUrl,
                  fit: BoxFit.cover,
                ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          /*  leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),*/

          title: Text(
            title,
            //     product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              //      cart.addItem(product.id, product.price, product.title);
              cart.addItem(id, price, title);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart!',
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      //   cart.removeSingleItem(product.id);
                      cart.removeSingleItem(id);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
