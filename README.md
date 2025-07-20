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

| Home Screen - Dark Theme | Category Filters | Favorites & Cart |
| :----------------------: | :--------------: | :--------------: |
| <img width="381" height="878" alt="home_screen_dark" src="https://github.com/user-attachments/assets/1c7d41fa-10fa-4e86-8f21-d79c3dc38aae" />
 | <img width="378" height="848" alt="home_screen" src="https://github.com/user-attachments/assets/bdd4f8aa-165b-4221-b3df-4b74b9fc418a" />
 | <img width="393" height="847" alt="cart_light" src="https://github.com/user-attachments/assets/7b8d90d1-24a5-4048-88d5-d0fa3eb7fe78" />
 |

| Login Screen | Profile Page | Cart Page |
| :----------: | :----------: | :-------: |
| <img width="388" height="841" alt="login_page" src="https://github.com/user-attachments/assets/257ba5ce-0457-4e3c-a100-c4fb1c6c4023" />
 | <img width="386" height="851" alt="app_drawer" src="https://github.com/user-attachments/assets/b9b80528-b0ff-4413-899d-515c61d7f00b" />
 | <img width="384" height="863" alt="favourite" src="https://github.com/user-attachments/assets/d8961740-1f66-401c-8c04-701c738ff7f3" />
 |

---

## 🚀 Getting Started

### 📦 Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code
- An emulator or a physical Android device

### ⚙️ Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-github-username/smart-shop.git](https://github.com/your-github-username/smart-shop.git)
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd smart-shop
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the app:**
    ```bash
    flutter run
    ```

To build a release APK for Android:
```bash
flutter build apk --release
