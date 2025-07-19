# Smart Shop - Flutter E-commerce App

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Screenshots](#screenshots)
* [Getting Started](#getting-started)

  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Project Structure](#project-structure)
* [Technologies Used](#technologies-used)
* [API](#api)
* [How to Use](#how-to-use)
* [Known Issues](#known-issues)
* [Contributing](#contributing)
* [License](#license)

---

## Overview

Smart Shop is a mini e-commerce Flutter app that demonstrates state management with Provider, persistent storage via SharedPreferences, dynamic theming, and RESTful API integration. Browse products, add to cart, favorite items, and toggle between light and dark modes in a seamless UI experience.

---

## Features

* **Login/Register:** Form validation, dummy login with SharedPreferences, splash screen navigation.
* **Home Page:** Fetch and display products from FakeStore API with images, names, prices, ratings.
* **Category Filter:** Dynamic categories (`All`, `men's clothing`, `women's clothing`, `electronics`, `jewelery`) for extra credit.
* **Sorting & Refresh:** Sort by price/rating, pull-to-refresh via RefreshIndicator.
* **Favorites:** Mark products as favorite, view favorites list, persistence via SharedPreferences.
* **Cart Page:** Add/remove products, manage quantities, display total price, persistent cart state.
* **Badge Notification:** Cart icon badge reflecting number of items.
* **Theme Toggling:** Light/Dark modes with Drawer switch and persistence.
* **Drawer Navigation:** Routes to Home, Cart, Favorites, Profile, and Logout.
* **Logout:** Clears login data and redirects to Login screen.
* **Custom Animations:** Animated AppBar, splash screen fade, hero transitions.

---

## Screenshots

<!-- Add your screenshots in the `screenshots/` folder and update paths accordingly -->

|                Home (Light)               |               Home (Dark)               |
| :---------------------------------------: | :-------------------------------------: |
| ![Home Light](screenshots/home_light.png) | ![Home Dark](screenshots/home_dark.png) |

|              Category Filter              |           Cart Page           |
| :---------------------------------------: | :---------------------------: |
| ![Categories](screenshots/categories.png) | ![Cart](screenshots/cart.png) |

---

## Getting Started

### Prerequisites

* Flutter SDK (>=2.0)
* Android Studio or VS Code
* Android/iOS device or emulator

### Installation

1. Clone the repository:

   ```bash
   https://github.com/Ahmad-Alomgir/smartshop.git
   cd smartshop
   ```
2. Install dependencies:

   ```bash
   flutter pub get
   ```
3. Run the app:

   ```bash
   flutter run
   ```
4. Build release APK:

   ```bash
   flutter build apk --release
   ```

---

## Project Structure

```
lib/
├── main.dart           # App entry point
├── app_theme.dart      # Light and dark theme definitions
├── constants.dart      # API base URL and other constants
├── models/             # Data models
│   ├── product.dart
│   └── cart_item.dart
├── providers/          # State management
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   ├── product_provider.dart
│   └── theme_provider.dart
├── screens/            # UI screens
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── cart_screen.dart
│   ├── favorites_screen.dart
│   ├── profile_screen.dart
│   └── product_detail_screen.dart
├── services/           # API service
│   └── api_service.dart
└── widgets/            # Reusable widgets
    ├── product_card.dart
    ├── drawer_widget.dart
    └── shimmer_product_card.dart
```

---

## Technologies Used

* Flutter & Dart
* Provider for state management
* SharedPreferences for local persistence
* HTTP package for REST API calls
* Flutter Rating Bar

---

## API

This app uses the [FakeStore API](https://fakestoreapi.com):

* **Get All Products:** `GET https://fakestoreapi.com/products`
* **Get Categories:** `GET https://fakestoreapi.com/products/categories`
* **Get Products by Category:** `GET https://fakestoreapi.com/products/category/{category}`

---

## How to Use

1. **Login:** Use `test@shop.com` / `1234`.
2. **Browse:** Filter by category, sort products.
3. **Favorites:** Tap the heart icon to favorite.
4. **Cart:** Add items, adjust quantities, view total.
5. **Theme:** Toggle dark/light in Drawer.
6. **Logout:** Use the Logout button in the Drawer.

---

## Known Issues

* No backend authentication (dummy login only).
* No payment integration (checkout is mocked).
* Some images may load slowly on poor network.

---

## Contributing

Contributions are welcome! Please:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-name`.
3. Commit your changes: `git commit -am 'Add feature'`.
4. Push to branch: `git push origin feature-name`.
5. Open a Pull Request.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
