import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:secondone/models/cart_model.dart';

class CartDetailsScreen extends StatefulWidget {
  final Cart cart;

  const CartDetailsScreen({Key? key, required this.cart})
      : super(key: key);

  @override
  State<CartDetailsScreen> createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  int selectedQuantity = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cart. ?? "--"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add product to cart logic
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(),
            items: (widget.cart.images ?? [])
                .map(
                  (item) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.network(item),
                  ),
                ),
              ),
            )
                .toList(),
          ),
          ListTile(
            title: Text("Brand: ${widget.cart.brand}"),
            subtitle: Text("In Stock: ${widget.cart.stock}"),
          ),
          ListTile(
            title: Text("Category: ${widget.cart.category}"),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Price: \$${widget.cart.price}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Text("${widget.cart.rating}"),
                const Icon(Icons.star),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(widget.cart.description ?? "--"),
          ),
          ListTile(
            title: const Text("Discount:"),
            subtitle: widget.cart.discountPercentage != null
                ? Text("${widget.cart.discountPercentage}% off")
                : const Text("No discount available"),
          ),
          ListTile(
            title: const Text("Quantity:"),
            trailing: DropdownButton<int>(
              value: selectedQuantity,
              onChanged: (value) {
                setState(() {
                  selectedQuantity = value!;
                });
              },
              items: List.generate(10, (index) => index + 1)
                  .map<DropdownMenuItem<int>>(
                    (value) => DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}