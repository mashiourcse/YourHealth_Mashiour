import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourhealth/Product/screens/shopping_completed_screen.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _nameController = TextEditingController();

  final _addressController = TextEditingController();

  final _bkashController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _key = GlobalKey<FormState>();

  bool isNameValid = false;
  bool isAddressValid = false;
  bool isPhoneNumberValid = false;

  @override
  void dispose() {
    _nameController.dispose();
    _bkashController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\৳${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(
                    cart: cart,
                    nameController: _nameController,
                    phoneNumberController: _phoneNumberController,
                    bkashController: _bkashController,
                    addressController: _addressController,
                    formKey: _key,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) => CartItem(
                      cart.items.values.toList()[i].id,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].quantity,
                      cart.items.values.toList()[i].title,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SingleChildScrollView(child: _getUserDetails())),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getUserDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              validator: (e) {
                if (e.isEmpty) {
                  isNameValid = false;
                  return "Name cannot be empty";
                }
                isNameValid = true;
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _nameController,
              decoration: InputDecoration(labelText: "Product Receiver Name"),
            ),
            TextFormField(
              validator: (e) {
                if (e.isEmpty) {
                  isAddressValid = false;
                  return "Address cannot be empty";
                } else {
                  isAddressValid = true;
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _addressController,
              decoration: InputDecoration(labelText: "Address"),
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _phoneNumberController,
              validator: (e) {
                if (e.isEmpty) {
                  isPhoneNumberValid = false;
                  return "Phone Number cannot be empty";
                } else if (e.length < 11 || e.length > 12) {
                  isPhoneNumberValid = false;
                  return "Invalid phone number";
                }
                isPhoneNumberValid = true;
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            TextFormField(
              controller: _bkashController,
              decoration: InputDecoration(
                  labelText: "bkash On 01875236239 (Give your Trx ID)"),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
    this.nameController,
    this.addressController,
    this.phoneNumberController,
    this.bkashController,
    this.formKey,
  }) : super(key: key);

  final Cart cart;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final TextEditingController bkashController;
  final GlobalKey<FormState> formKey;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
        onPressed: () async {
          if (widget.formKey.currentState.validate()) {
            setState(() {
              _isLoading = true;
            });
            await Provider.of<Orders>(context, listen: false).addOrder(
              widget.cart.items.values.toList(),
              widget.cart.totalAmount,
              widget.nameController.text,
              widget.phoneNumberController.text,
              widget.addressController.text,
              widget.bkashController.text,
            );
            setState(() {
              _isLoading = false;
            });
            widget.cart.clear();
            Navigator.pop(context);
            Navigator.pushNamed(context, ShoppingCompletedScreen.routeName);
          }
          ;
        });
  }
}
