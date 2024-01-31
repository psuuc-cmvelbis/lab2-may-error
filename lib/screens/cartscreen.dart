import 'package:flutter/material.dart';
import 'package:velbis_labact2/models/product.dart';

class Cart extends StatefulWidget {
  Cart({super.key, required this.cartItems});
  List<Product> cartItems;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: widget.cartItems.length,
          itemBuilder: (context, index) {
            final product = widget.cartItems[index];
            return Card(
              elevation: 5,
              child: ListTile(
                title: Text(product.nameDesc),
                subtitle: Text(product.code),
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.cartItems.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.remove_circle),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
