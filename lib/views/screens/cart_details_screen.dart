import 'package:flutter/material.dart';
import 'package:secondone/models/cart_model.dart';
import 'package:secondone/service/cart_service.dart';

class CartDetailsScreen extends StatefulWidget {
  const CartDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CartDetailsScreen> createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  List<CartItem> cartProducts = [];

  @override
  void initState() {
    super.initState();
    cartProducts = CartService.getCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final product = cartProducts[index];
          return ListTile(
            title: Text(product.title ?? "--"),
            subtitle: Text('Quantity: ${product.quantity}'),
          );
        },
      ),
    );
  }
}