import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/drawer_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      drawer: buildAppDrawer(context),
      body: cartItems.isEmpty
          ? const Center(
        child: Text('Your cart is empty'),
      )
          : Column(
        children: [
      Expanded(
      child: ListView.builder(
      itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼️ Product Image
                Image.network(
                  product.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 10),

                // 📄 Product Details & Buttons
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text('\$${product.price.toStringAsFixed(2)}'),
                      RatingBarIndicator(
                        rating: product.rating,
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 16,
                      ),
                      const SizedBox(height: 4),
                      Text('Qty: ${product.quantity}'),

                      // ➖➕ Buttons
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .decreaseQuantity(product.id);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addToCart(
                                Product(
                                  id: product.id,
                                  title: product.title,
                                  price: product.price,
                                  description: '',
                                  category: '',
                                  image: product.image,
                                  rating: product.rating, quantity: 1,
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeFromCart(product.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                // Implement checkout or clear cart functionality here if desired
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout not implemented')),
                );
              },
              child: const Text('Checkout'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
