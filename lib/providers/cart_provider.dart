import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, CartItem> _items = {};

  CartProvider() {
    _loadCart();
  }

  Map<int, CartItem> get items => _items;

  int get itemCount => _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.values.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        rating: product.rating,
        quantity: 1,
      );
    }
    _saveCart();
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.remove(productId);
    _saveCart();
    notifyListeners();
  }

  void decreaseQuantity(int productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
      _saveCart();
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    _saveCart();
    notifyListeners();
  }

  bool isInCart(int productId) {
    return _items.containsKey(productId);
  }

  // Save to SharedPreferences
  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJsonList = _items.values.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cartItems', cartJsonList);
  }

  // Load from SharedPreferences
  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('cartItems');
    if (saved != null) {
      _items.clear();
      for (final item in saved) {
        final jsonItem = jsonDecode(item);
        final cartItem = CartItem.fromJson(jsonItem);
        _items[cartItem.id] = cartItem;
      }
      notifyListeners();
    }
  }
}
