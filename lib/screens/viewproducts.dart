import 'package:flutter/material.dart';
import 'package:velbis_labact2/screens/cartscreen.dart';
import 'package:provider/provider.dart';
import 'package:velbis_labact2/models/product.dart';
import 'package:velbis_labact2/providers/productprovider.dart';
import 'package:velbis_labact2/screens/manageproduct.dart';

class ViewProductsScreen extends StatelessWidget {
  ViewProductsScreen({super.key});

  void openAddProduct(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ManageProductScreen(),
      ),
    );
  }

  void openEditProduct(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(
          index: index,
        ),
      ),
    );
  }

  void changeFavorite(BuildContext context, int index) {
    Provider.of<Products>(context, listen: false).toggleFavorite(index);
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Products'),
        actions: [
          IconButton(
            onPressed: () => openAddProduct(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<Products>(builder: (_, provider, child) {
        var products = provider.items;
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (_, index) {
            return Card(
              child: ListTile(
                onTap: () => openEditProduct(context, index),
                leading: IconButton(
                  onPressed: () => changeFavorite(context, index),
                  icon: Icon(products[index].isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline),
                ),
                trailing: IconButton(
                  onPressed: () {
                    productsProvider.addcart(index);
                    print('add cart');
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                title: Text(productsProvider.items[index].nameDesc),
                subtitle: Text(productsProvider.items[index].code),
              ),
            );
          },
          itemCount: productsProvider.totalNoItems,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Cart(
                cartItems: productsProvider.cartItems,
              ),
            ),
          );
        },
        child: Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}
