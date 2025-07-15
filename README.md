# Smart Shop - Flutter Mini E-Commerce App

[![Flutter](https://img.shields.io/badge/Flutter-3.10-blue.svg?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0-blue.svg?logo=dart)]
[![License](https://img.shields.io/badge/License-MIT-green.svg)]

---

## Table of Contents

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

---

## Overview

Smart Shop is a fully functional mini e-commerce Flutter app showcasing key mobile development concepts such as state management, persistent storage, RESTful API integration, theme toggling, and smooth UI/UX.

The app connects with the [FakeStore API](https://fakestoreapi.com) to fetch product data dynamically, allowing users to browse products by category, add favorites, manage a cart, and toggle dark/light themes. Login state and preferences persist across app sessions using SharedPreferences.

---

## Features

- **Login & Registration**  
  - Form validation with email/password input  
  - Dummy authentication using test credentials  
  - Persistent login state via SharedPreferences  
  - Splash screen checking login status

- **Home Screen**  
  - Dynamic product list fetched from FakeStore API  
  - Filter products by categories loaded from API  
  - Sort products by price (low to high, high to low) and rating  
  - Pull-to-refresh to reload products  
  - Mark/unmark favorites saved persistently  
  - Display product rating stars  
  - Responsive grid layout for products  

- **Cart Screen**  
  - Add/remove items to/from cart  
  - View total price and items count  
  - Cart badge showing current item count  

- **Favorites Screen**  
  - View list of favorited products  

- **Theme Management**  
  - Dark and Light themes  
  - Toggle switch in navigation drawer  
  - Persist theme choice using SharedPreferences  

- **Navigation Drawer**  
  - Navigate between Home, Cart, Favorites, Profile, and Logout  
  - Logout clears session and returns to login screen  

---

## Screenshots

| Splash Screen | Login Screen | Home Screen |
| ------------- | ------------ | ----------- |
| ![Splash](screenshots/splash.png) | ![Login](screenshots/login.png) | ![Home](screenshots/home.png) |

| Cart Screen | Favorites Screen | Profile Screen |
| ----------- | --------------- | -------------- |
| ![Cart](screenshots/cart.png) | ![Favorites](screenshots/favorites.png) | ![Profile](screenshots/profile.png) |

---

## Getting Started

### Prerequisites

- Flutter SDK (v3.0 or above recommended)  
- Dart (comes with Flutter)  
- Android Studio, VS Code, or any Flutter-supported IDE  
- Device or emulator to run the app

### Installation

1. Clone this repo:  
   ```bash
   git clone https://github.com/yourusername/smart-shop-flutter.git
   cd smart-shop-flutter

2. Install Dependecies:
     ```bash
     flutter pub get

3. Run the app
   ```bash
    flutter run

4. Project Structure
   lib/
├── assets/              # Images, logos, icons
├── models/              # Data classes (Product, User, etc.)
├── providers/           # State management (Auth, Product, Cart, Theme)
├── screens/             # UI Screens (Login, Home, Cart, Profile)
├── services/            # API service calls
├── widgets/             # Reusable UI components (ProductCard, Drawer, etc.)
main.dart               # App entry point and routing



