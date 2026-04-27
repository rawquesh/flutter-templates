import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'FoodieGo';
  static const String appTagline = 'Delicious food delivered';

  static const List<FoodCategory> categories = [
    FoodCategory(name: 'Pizza', icon: Icons.local_pizza, color: Color(0xFFFF9800)),
    FoodCategory(name: 'Burgers', icon: Icons.lunch_dining, color: Color(0xFFE53935)),
    FoodCategory(name: 'Asian', icon: Icons.ramen_dining, color: Color(0xFFD32F2F)),
    FoodCategory(name: 'Indian', icon: Icons.restaurant, color: Color(0xFFFF5722)),
    FoodCategory(name: 'Mexican', icon: Icons.local_fire_department, color: Color(0xFFF57C00)),
    FoodCategory(name: 'Healthy', icon: Icons.eco, color: Color(0xFF4CAF50)),
    FoodCategory(name: 'Desserts', icon: Icons.cake, color: Color(0xFFE91E63)),
    FoodCategory(name: 'Drinks', icon: Icons.local_cafe, color: Color(0xFF795548)),
  ];

  static const List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Pizza Palace',
      cuisine: 'Italian, Pizza',
      rating: 4.5,
      reviewCount: 234,
      deliveryTime: '25-35 min',
      deliveryFee: 2.99,
      distance: '1.2 km',
      imageGradient: [Color(0xFFFF9800), Color(0xFFE65100)],
      isOpen: true,
    ),
    Restaurant(
      id: '2',
      name: 'Burger Barn',
      cuisine: 'American, Burgers',
      rating: 4.3,
      reviewCount: 189,
      deliveryTime: '20-30 min',
      deliveryFee: 0,
      distance: '0.8 km',
      imageGradient: [Color(0xFFE53935), Color(0xFFB71C1C)],
      isOpen: true,
    ),
    Restaurant(
      id: '3',
      name: 'Sushi Supreme',
      cuisine: 'Japanese, Sushi',
      rating: 4.8,
      reviewCount: 412,
      deliveryTime: '35-45 min',
      deliveryFee: 3.99,
      distance: '2.1 km',
      imageGradient: [Color(0xFF1976D2), Color(0xFF0D47A1)],
      isOpen: true,
    ),
    Restaurant(
      id: '4',
      name: 'Taco Town',
      cuisine: 'Mexican, Tacos',
      rating: 4.2,
      reviewCount: 156,
      deliveryTime: '25-35 min',
      deliveryFee: 1.99,
      distance: '1.5 km',
      imageGradient: [Color(0xFFFFB300), Color(0xFFFF8F00)],
      isOpen: true,
    ),
    Restaurant(
      id: '5',
      name: 'Curry House',
      cuisine: 'Indian, Curry',
      rating: 4.6,
      reviewCount: 298,
      deliveryTime: '30-40 min',
      deliveryFee: 2.49,
      distance: '1.8 km',
      imageGradient: [Color(0xFFFF5722), Color(0xFFE64A19)],
      isOpen: true,
    ),
    Restaurant(
      id: '6',
      name: 'Green Garden',
      cuisine: 'Healthy, Salads',
      rating: 4.4,
      reviewCount: 167,
      deliveryTime: '20-25 min',
      deliveryFee: 0,
      distance: '0.5 km',
      imageGradient: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
      isOpen: true,
    ),
    Restaurant(
      id: '7',
      name: 'Pasta Paradise',
      cuisine: 'Italian, Pasta',
      rating: 4.7,
      reviewCount: 345,
      deliveryTime: '30-40 min',
      deliveryFee: 2.99,
      distance: '1.3 km',
      imageGradient: [Color(0xFF9C27B0), Color(0xFF7B1FA2)],
      isOpen: false,
    ),
    Restaurant(
      id: '8',
      name: 'Dragon Wok',
      cuisine: 'Chinese, Asian',
      rating: 4.1,
      reviewCount: 201,
      deliveryTime: '25-35 min',
      deliveryFee: 1.99,
      distance: '1.9 km',
      imageGradient: [Color(0xFFD32F2F), Color(0xFFC62828)],
      isOpen: true,
    ),
  ];

  static const List<MenuItem> pizzaPalaceMenu = [
    MenuItem(
      id: 'p1',
      name: 'Margherita Pizza',
      description: 'Fresh tomatoes, mozzarella, basil, and olive oil',
      price: 12.99,
      isVeg: true,
      isBestseller: true,
      calories: 850,
      imageGradient: [Color(0xFFFF9800), Color(0xFFFF5722)],
    ),
    MenuItem(
      id: 'p2',
      name: 'Pepperoni Feast',
      description: 'Loaded with pepperoni and extra cheese',
      price: 14.99,
      isVeg: false,
      isBestseller: true,
      calories: 1100,
      imageGradient: [Color(0xFFE53935), Color(0xFFB71C1C)],
    ),
    MenuItem(
      id: 'p3',
      name: 'Veggie Supreme',
      description: 'Bell peppers, mushrooms, olives, onions',
      price: 13.99,
      isVeg: true,
      calories: 920,
      imageGradient: [Color(0xFF4CAF50), Color(0xFF388E3C)],
    ),
    MenuItem(
      id: 'p4',
      name: 'BBQ Chicken',
      description: 'Grilled chicken, BBQ sauce, red onions',
      price: 15.99,
      isVeg: false,
      calories: 1050,
      imageGradient: [Color(0xFF795548), Color(0xFF5D4037)],
    ),
    MenuItem(
      id: 'p5',
      name: 'Hawaiian Dream',
      description: 'Ham, pineapple, and mozzarella',
      price: 14.49,
      isVeg: false,
      calories: 980,
      imageGradient: [Color(0xFFFFEB3B), Color(0xFFFBC02D)],
    ),
    MenuItem(
      id: 'p6',
      name: 'Garlic Bread',
      description: 'Toasted bread with garlic butter',
      price: 5.99,
      isVeg: true,
      calories: 320,
      imageGradient: [Color(0xFFFFD54F), Color(0xFFFFC107)],
    ),
    MenuItem(
      id: 'p7',
      name: 'Caesar Salad',
      description: 'Romaine lettuce, parmesan, croutons',
      price: 8.99,
      isVeg: true,
      calories: 450,
      imageGradient: [Color(0xFF8BC34A), Color(0xFF689F38)],
    ),
    MenuItem(
      id: 'p8',
      name: 'Cola 500ml',
      description: 'Chilled soft drink',
      price: 2.49,
      isVeg: true,
      calories: 210,
      imageGradient: [Color(0xFF212121), Color(0xFF424242)],
    ),
  ];

  static const List<String> menuCategories = [
    'Starters',
    'Mains',
    'Sides',
    'Drinks',
    'Desserts',
  ];

  static const List<String> recentSearches = [
    'Pizza near me',
    'Burger King',
    'Sushi delivery',
    'Indian food',
    'Thai curry',
  ];

  static const List<String> popularSearches = [
    'Pizza',
    'Burgers',
    'Sushi',
    'Tacos',
    'Pasta',
    'Salads',
    'Fried Chicken',
    'Noodles',
  ];

  static const List<PromoBanner> promoBanners = [
    PromoBanner(
      title: '50% OFF',
      subtitle: 'On your first order',
      gradient: [Color(0xFFFF7B00), Color(0xFFFF4500)],
    ),
    PromoBanner(
      title: 'Free Delivery',
      subtitle: 'On orders above \$20',
      gradient: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
    ),
    PromoBanner(
      title: 'Cashback 20%',
      subtitle: 'On all pizzas',
      gradient: [Color(0xFF2196F3), Color(0xFF1976D2)],
    ),
  ];
}

class FoodCategory {
  final String name;
  final IconData icon;
  final Color color;

  const FoodCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class Restaurant {
  final String id;
  final String name;
  final String cuisine;
  final double rating;
  final int reviewCount;
  final String deliveryTime;
  final double deliveryFee;
  final String distance;
  final List<Color> imageGradient;
  final bool isOpen;

  const Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.reviewCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
    required this.imageGradient,
    required this.isOpen,
  });
}

class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final bool isVeg;
  final bool isBestseller;
  final int calories;
  final List<Color> imageGradient;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isVeg,
    this.isBestseller = false,
    required this.calories,
    required this.imageGradient,
  });
}

class PromoBanner {
  final String title;
  final String subtitle;
  final List<Color> gradient;

  const PromoBanner({
    required this.title,
    required this.subtitle,
    required this.gradient,
  });
}

class CartItem {
  final MenuItem item;
  int quantity;
  final List<String> customizations;
  double customPrice;

  CartItem({
    required this.item,
    this.quantity = 1,
    this.customizations = const [],
    this.customPrice = 0,
  });

  double get totalPrice => (item.price + customPrice) * quantity;
}

class Order {
  final String id;
  final String restaurantName;
  final List<CartItem> items;
  final double total;
  final String status;
  final DateTime date;
  final String? eta;

  const Order({
    required this.id,
    required this.restaurantName,
    required this.items,
    required this.total,
    required this.status,
    required this.date,
    this.eta,
  });
}
