import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  final String name;
  final String phoneNumber;
  final String address;
  final String bkash;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
    @required this.name,
    @required this.phoneNumber,
    @required this.address,
    @required this.bkash,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final List<OrderItem> loadedOrders = [];

    /* const url = 'https://yourhealth-app.firebaseio.com/orders.json';
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          name: orderData['name'],
          address: orderData['address'],
          bkash: orderData['bkash'],
          phoneNumber: orderData['phone'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
        ),
      );
    }); */
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> deleteOrder(String id) async {
    await FirebaseFirestore.instance.collection("orders").doc(id).delete();
    /* var url = 'https://yourhealth-app.firebaseio.com/orders/$id.json';
    final response = await http.delete(url); */
    _orders.removeWhere((element) => element.id == id);
    // notifyListeners();
  }

  // Future<void> updateImageUrl(String id, String imageUrl) async {
  //   var url = 'https://halcyon-607fe.firebaseio.com/orders/$id.json';
  //   final response =
  //       await http.put(url, body: json.encode({'imageUrl': imageUrl}));
  // }

  Future<void> addOrder(List<CartItem> cartProducts, double total, String name,
      String phoneNumber, String address, String bkash) async {
    final timestamp = DateTime.now(); //fire
    DocumentReference ref =
        await FirebaseFirestore.instance.collection("orders").doc();
    ref.set({
      'amount': total,
      'dateTime': timestamp.toIso8601String(),
      'name': name,
      'address': address,
      'bkash': bkash,
      'id': ref.id,
      'phone': phoneNumber,
      'products': cartProducts
          .map((cp) => {
                'id': cp.id,
                'title': cp.title,
                'quantity': cp.quantity,
                'price': cp.price,
              })
          .toList(),
    });

    /* const url = 'https://yourhealth-app.firebaseio.com/orders.json';
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'name': name,
        'address': address,
        'bkash': bkash,
        'phone': phoneNumber,
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    ); */
    _orders.insert(
      0,
      OrderItem(
        id: ref.id,
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
