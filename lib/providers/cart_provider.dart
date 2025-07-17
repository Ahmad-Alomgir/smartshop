import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, Product> _items = {};

  CartProvider() {
    _loadCart();
  }

  Map<int, Product> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice =>
      _items.values.fold(0, (sum, product) => sum + product.price);

  void addToCart(Product product) {
    _items[product.id] = product;
    _saveCart();
    notifyListeners();
  }

  void removeFromCart(int id) {
    _items.remove(id);
    _saveCart();
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _saveCart();
    notifyListeners();
  }

  bool isInCart(int id) {
    return _items.containsKey(id);
  }

  // 🔐 Save cart data to SharedPreferences
  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    final cartList = _items.values
        .map((product) => jsonEncode(product.toJson()))
        .toList();

    await prefs.setStringList('cartItems', cartList);
  }

  // 🔄 Load cart data from SharedPreferences
  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCart = prefs.getStringList('cartItems');

    if (savedCart != null) {
      for (var item in savedCart) {
        final product = Product.fromJson(jsonDecode(item));
        _items[product.id] = product;
      }
      notifyListeners();
    }
  }
}
