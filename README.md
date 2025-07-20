# 🛍️ Smart Shop - Mini E-commerce Flutter App

Smart Shop is a beautifully designed mini e-commerce application built using Flutter. It fetches product data from the FakeStore API and includes essential shopping features such as login, cart, favorites, category filtering, and theme switching.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [API](#api)
- [How to Use](#how-to-use)
- [Known Issues](#known-issues)
- [Contributing](#contributing)
- [License](#license)
- [Credits](#credits)

---

## 📖 Overview

Smart Shop is a Flutter-based mobile shopping app that allows users to browse products, add them to their cart, mark favorites, and toggle between dark and light themes. It demonstrates essential mobile app development concepts using **Provider**, **SharedPreferences**, **REST APIs**, and more.

---

## ✨ Features

- 🔐 Login screen with dummy credentials and validation
- 🏠 Product listing with name, price, rating, and favorite toggle
- 💖 Favorites screen with persistent favorite items
- 🛒 Cart page with total price and item count badge
- 🎨 Theme toggling (Dark/Light mode)
- 🔄 `RefreshIndicator` to reload product list
- 📂 Category filter using FakeStore API
- 🔁 Drawer navigation with routes to all screens
- 🚪 Logout with confirmation and state clearing

---

## 📸 Screenshots

> **Note:** Replace these links with your own hosted or local image paths.

| Home Screen - Dark Theme | Category and sorting | Cart page|
| :----------------------: | :--------------: | :--------------: |
| <div align="center"><img width="381" height="878" alt="home_screen_dark" src="https://github.com/user-attachments/assets/1c7d41fa-10fa-4e86-8f21-d79c3dc38aae" /></div> | <div align="center"><img width="378" height="848" alt="home_screen" src="https://github.com/user-attachments/assets/bdd4f8aa-165b-4221-b3df-4b74b9fc418a" /></div> | <div align="center"><img width="393" height="847" alt="cart_light" src="https://github.com/user-attachments/assets/7b8d90d1-24a5-4048-88d5-d0fa3eb7fe78" /></div> |

| Login Screen | app drawer  | Favourite Page |
| :----------: | :----------: | :-------: |
| <div align="center"><img width="388" height="841" alt="login_page" src="https://github.com/user-attachments/assets/257ba5ce-0457-4e3c-a100-c4fb1c6c4023" /></div> | <div align="center"><img width="386" height="851" alt="app_drawer" src="https://github.com/user-attachments/assets/b9b80528-b0ff-4413-899d-515c61d7f00b" /></div> | <div align="center"><img width="384" height="863" alt="favourite" src="https://github.com/user-attachments/assets/d8961740-1f66-401c-8c04-701c738ff7f3" /></div> |

---

## 🚀 Getting Started

### 📦 Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code
- An emulator or a physical Android device

### ⚙️ Installation

1.  **Clone the repository:**
    
    \`\`\`bash
    git clone \https://github.com/Ahmad-Alomgir/smartshop.git
    \`\`\`
    
2.  **Navigate to the project directory:**
    
    \`\`\`bash
    cd smartshop
    \`\`\`
    
3.  **Install dependencies:**
    
    \`\`\`bash
    flutter pub get
    \`\`\`
    
4.  **Run the app:**
    
    \`\`\`bash
    flutter run
    \`\`\`

To build a release APK for Android:

\`\`\`bash
flutter build apk --release
\`\`\`

---

## 📁 Project Structure

Here is the basic structure of the project directory:
lib/
├── main.dart         # App entry point
├── app_theme.dart    # Theme configuration
├── models/           # Data models (e.g., Product)
├── providers/        # State management (e.g., CartProvider, ThemeProvider)
├── screens/          # UI for each page (e.g., HomeScreen, LoginScreen)
├── widgets/          # Reusable UI components
└── services/         # API handling and other services

---

## 🧰 Technologies Used

-   **Flutter**: For building the cross-platform application.
-   **Dart**: The programming language for Flutter.
-   **Provider**: For simple and effective state management.
-   **SharedPreferences**: For persisting simple data like theme settings and favorites.
-   **REST API Integration**: Using the `http` package to communicate with the FakeStore API.
-   **Android SDK**: To build and run the application on Android devices.

---

## 🌐 API

This app uses the public [FakeStore API](https://fakestoreapi.com/) to fetch all product-related data, including:

-   Product lists
-   Product details by ID
-   A list of all available categories
-   Product ratings and descriptions

---

## 💡 How to Use

1.  **Login**: Use the dummy credentials to log in:
    -   **Email**: `smartshop@gmail.com`
    -   **Password**: `2025`
2.  **Browse Products**: Scroll through the product list on the home screen.
3.  **Filter**: Open the drawer and select a category to view specific products.
4.  **Add to Cart/Favorites**: Tap the cart or heart icon on any product card.
5.  **Change Theme**: Open the drawer and use the toggle switch to change between light and dark modes.
6.  **View Cart & Profile**: Navigate to the Cart or Profile pages using the drawer.
7.  **Logout**: Safely log out from the profile page.

---

## 🐛 Known Issues

-   Product images may load slowly on poor network connections as there is no advanced image caching implemented.
-   The application is for demonstration purposes only and lacks a real backend, database, or secure authentication.

---

## 🤝 Contributing

Contributions are welcome! If you have suggestions for improving the app, please feel free to fork the repository and submit a pull request.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/NewFeature`)
3.  Commit your Changes (`git commit -m 'Add some NewFeature'`)
4.  Push to the Branch (`git push origin feature/NewFeature`)
5.  Open a Pull Request

---

## 📝 License

This project is distributed under the MIT License. See the `LICENSE` file for more information.

---

## 🙌 Credits

-   Developed by **\[Sheikh Abu Ahmad Alomgir]**
\`\`\`
