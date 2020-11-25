import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import './edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  snapshot.data.docs[i].data()["id"],
                  snapshot.data.docs[i].data()["title"],
                  snapshot.data.docs[i].data()["imageUrl"],
                  //  productsData.items[i].title,
                  //  productsData.items[i].imageUrl,
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
