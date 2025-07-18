import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';
import '../services/api_service.dart';

enum SortOption {
  none,
  priceLowToHigh,
  priceHighToLow,
  ratingHighToLow,
}

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<int> _favoriteIds = [];
  List<String> _categories = ['All'];
  String _selectedCategory = 'All';
  SortOption _sortOption = SortOption.none;

  bool _isLoading = true;

  List<Product> get products => _products;
  List<int> get favoriteIds => _favoriteIds;
  List<String> get categories => _categories;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;
  SortOption get sortOption => _sortOption;

  Future<void> init() async {
    await fetchCategories();
    await _loadFavorites();

    final prefs = await SharedPreferences.getInstance();
    final savedCat = prefs.getString('selectedCategory') ?? 'All';
    await filterByCategory(savedCat);
  }

  // Fetch products (all or by category)
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = _selectedCategory == 'All'
          ? await ApiService.fetchAllProducts()
          : await ApiService.fetchProductsByCategory(_selectedCategory);
      _applySorting();
    } catch (e) {
      debugPrint('Error fetching products: $e');
      _products = [];
    }

    // After fetch, loading false and notify again
    _isLoading = false;
    notifyListeners();
  }

  // Sort based on option
  void _applySorting() {
    if (_sortOption == SortOption.priceLowToHigh) {
      _products.sort((a, b) => a.price.compareTo(b.price));
    } else if (_sortOption == SortOption.priceHighToLow) {
      _products.sort((a, b) => b.price.compareTo(a.price));
    } else if (_sortOption == SortOption.ratingHighToLow) {
      _products.sort((a, b) => b.rating.compareTo(a.rating));
    }
  }

  void setSortOption(SortOption option) {
    _sortOption = option;
    _applySorting();
    notifyListeners();
  }

  // Toggle favorite
  void toggleFavorite(int id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'favorites', _favoriteIds.map((e) => e.toString()).toList());

    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favorites') ?? [];
    _favoriteIds = saved.map(int.parse).toList();
  }

  List<Product> get favorites =>
      _products.where((p) => _favoriteIds.contains(p.id)).toList();

  // Fetch categories from API
  Future<void> fetchCategories() async {
    try {
      final data = await ApiService.fetchCategories();
      _categories = ['All', ...data];
      notifyListeners();
    } catch (e) {
      debugPrint("Failed to fetch categories: $e");
    }
  }

  // Set and filter by category
  Future<void> filterByCategory(String category) async {
    _selectedCategory = category;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCategory', category);

    await fetchProducts();
  }
}
