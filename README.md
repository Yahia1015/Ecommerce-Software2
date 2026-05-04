# 🛒 E-Commerce Flutter App | Software 2 Project

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## 📌 Project Overview
A comprehensive, full-stack E-Commerce mobile application built from scratch as an individual project for the **Software 2** course. The app features a complete business cycle, from admin product management to user authentication, real-time shopping, and order placement.

---

## ✨ Key Features

### 👨‍💼 Admin Operations
* **Admin Dashboard:** A dedicated secure control panel for store managers.
* **Product Management:** Add new products with names, prices, and image URLs.
* **Direct Database Integration:** Products are instantly uploaded to the cloud database.

### 👤 User Experience
* **Secure Authentication:** Full Login and Registration system for users.
* **Real-Time Feed:** Users can browse products that update dynamically without refreshing the app.
* **Shopping Cart:** A dynamic cart that tracks selected items and calculates the total price.
* **Checkout System:** Converts cart items into actual orders saved securely on the server.

---

## 🛠️ Technology Stack & Architecture

* **Frontend Framework:** Flutter (Dart)
* **Backend Services:** Firebase
  * **Firebase Authentication:** For secure user sign-up and login.
  * **Cloud Firestore:** NoSQL real-time database for storing `products` and `orders`.
* **State Management:** Core Flutter state management (`setState`) for dynamic cart updates.

---

## 📂 Project Structure
A clean and modular architecture was implemented to separate logic and UI:

- **lib/**
  - **screens/**
    - `add_product_screen.dart` (Admin product entry)
    - `admin_screen.dart` (Manager dashboard)
    - `products_screen.dart` (User shopping interface)
    - `cart_screen.dart` (Dynamic checkout system)
    - `login_screen.dart` (User & Admin access)
    - `register_screen.dart` (New user onboarding)
  - `firebase_options.dart` (Firebase configuration)
  - `main.dart` (App entry point)

---

## 🚀 How to Run the Project

1. Clone the repository to your local machine.
2. Ensure you have the Flutter SDK installed.
3. Open the project in VS Code or Android Studio.
4. Run the following commands in the terminal:
   - `flutter pub get`
   - `flutter run -d chrome`

---

## 🎓 Academic Context
This project was developed entirely as an individual effort to demonstrate core software engineering principles, database integration, and UI/UX implementation for the **Software 2** curriculum.