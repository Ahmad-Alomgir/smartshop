class CartItem {
  final int id;
  final String title;
  final double price;
  final String image;
  final double rating;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'image': image,
    'rating': rating,
    'quantity': quantity,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'],
      quantity: json['quantity'],
    );
  }
}
