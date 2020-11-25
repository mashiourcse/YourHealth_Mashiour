import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yourhealth/Product/providers/orders.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  // final ord.OrderItem order;
  final Map<String, dynamic> map;
  OrderItem(this.map);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 100,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\৳${widget.map["amount"]}',
                      //   '\$${widget.order.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "${widget.map["name"]}",
                      // "${widget.order.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy hh:mm')
                          //        .format(widget.order.dateTime),
                          .format(DateTime.parse(widget.map["dateTime"])),
                    ),
                    IconButton(
                      icon: Icon(
                          _expanded ? Icons.expand_less : Icons.expand_more),
                      onPressed: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: 300,
              child: ListView(
                children: <Widget>[
                  _getOrders(),
                  //     _getUserInformation(widget.order.phoneNumber,
                  //       widget.order.address, widget.order.bkash),
                  _getUserInformation(widget.map["phone"],
                      widget.map["address"], widget.map["bkash"]),
                  //          _getButtons(widget.order.id),
                  _getButtons(widget.map["id"]),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _getButtons(String id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          color: Colors.red,
          onPressed: () async {
            // final a = Provider.of<Orders>(context).deleteOrder(id);
            await FirebaseFirestore.instance
                .collection("orders")
                .doc(id)
                .delete();
          },
          child: Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
        /*  RaisedButton(
            color: Colors.green,
            onPressed: () {
              final a = Provider.of<Orders>(context).deleteOrder(id);
            },
            child: Text("Deliver", style: TextStyle(color: Colors.white))),*/
      ],
    );
  }

  Widget _getUserInformation(String phoneNumber, String address, String bkash) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "User Details",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Phone Number: $phoneNumber",
                  style: TextStyle(fontSize: 16.0)),
              Text("Address: $address", style: TextStyle(fontSize: 16.0)),
              Text("bkash: $bkash", style: TextStyle(fontSize: 16.0))
            ],
          )
        ],
      ),
    );
  }

  Widget _getOrders() {
    List<Row> res = new List<Row>();
    for (int i = 0; i < widget.map["products"].length; i++) {
      res.add(getRow(
          widget.map["products"][i]["title"],
          widget.map["products"][i]["quantity"].toString(),
          widget.map["products"][i]["price"].toString()));
    }

    return Column(
      children: res,
    );
  }

  Row getRow(String title, String quantity, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          // prod["title"],
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          //  '${prod["quantity"]}x \$${prod["price"]}',
          '$quantity x $price',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
