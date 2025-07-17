import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/product_card.dart';
import '../widgets/shimmer_product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).init();
  }

  Future<void> _refreshProducts() async {
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Shop'),
        actions: [
          // Cart Icon with badge
          IconButton(
            icon: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                if (cartProvider.itemCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        cartProvider.itemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),

            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),

          // Sorting menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              if (value == "Price: Low to High") {
                productProvider.setSortOption(SortOption.priceLowToHigh);
              } else if (value == "Price: High to Low") {
                productProvider.setSortOption(SortOption.priceHighToLow);
              } else if (value == "Rating") {
                productProvider.setSortOption(SortOption.ratingHighToLow);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: "Price: Low to High", child: Text("Price: Low to High")),
              PopupMenuItem(value: "Price: High to Low", child: Text("Price: High to Low")),
              PopupMenuItem(value: "Rating", child: Text("Rating")),
            ],
          ),
        ],
      ),
      drawer: buildAppDrawer(context),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshProducts,
          child: CustomScrollView(
            slivers: [
              // Category Chips
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    itemCount: productProvider.categories.length,
                    itemBuilder: (context, index) {
                      final category = productProvider.categories[index];
                      final isSelected = category == productProvider.selectedCategory;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (_) {
                            productProvider.filterByCategory(category);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Loading shimmer
              if (productProvider.isLoading)
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: 6,
                          (context, index) => const ShimmerProductCard(),
                    ),
                  ),
                )
              // Show products
              else if (productProvider.products.isEmpty)
                const SliverFillRemaining(
                  child: Center(child: Text("No products found")),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final product = productProvider.products[index];
                        return ProductCard(product: product);
                      },
                      childCount: productProvider.products.length,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
