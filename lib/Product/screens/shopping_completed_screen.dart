import 'package:flutter/material.dart';
import 'package:yourhealth/Product/screens/products_overview_screen.dart';

class ShoppingCompletedScreen extends StatelessWidget {
  static const routeName = "/shopping-completed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Congratulations! Your Has Done'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/yourhealth-app.appspot.com/o/24332133.jpg?alt=media&token=c16081c4-aeef-4a12-810c-8b7a04f0badb',
                width: 200,
                height: 100,
              ),
              Text("Your order is done",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  )),
              const SizedBox(height: 40),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/yourhealth-app.appspot.com/o/123231186_3592045494188003_7155161261985300914_n.jpg?alt=media&token=2f8f3f42-852c-45c2-8443-d2874f38eeaa',
                width: 400,
                height: 300,
              ),
              Center(
                child: Text(
                  "      You will get your order within 2-3 days. Thank you for your order",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Back to shopping page",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductsOverviewScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
