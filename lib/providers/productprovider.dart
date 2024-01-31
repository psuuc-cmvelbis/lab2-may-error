import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velbis_labact2/models/product.dart';
import 'package:velbis_labact2/providers/cartprovider.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [];

  // List<Product> get items {
  //   return _items;
  // }
  List<Product> cartItems = [];
  List<Product> get items => _items;

  int get totalNoItems {
    return _items.length;
  }

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void edit(Product product, int index) {
    _items[index] = product;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _items[index].isFavorite = !_items[index].isFavorite;
    notifyListeners();
  }

  void addcart(int index) {
    cartItems.add(_items[index]);
    notifyListeners();
  }

  Product item(int index) => _items[index];
}
