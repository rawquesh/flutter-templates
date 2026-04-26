class AppConstants {
  static const String appName = 'ShopWave';
  static const String appSlogan = 'Shop the world';

  static const List<String> categoryNames = [
    'Clothing',
    'Electronics',
    'Home & Garden',
    'Sports & Outdoors',
    'Beauty & Care',
    'Books & Media',
    'Toys & Games',
    'Food & Drinks',
    'Pet Supplies',
    'Automotive',
  ];

  static const List<String> featuredProducts = [
    'Premium Wireless Headphones',
    'Smart Watch Pro',
    'Designer Sneakers',
    'Luxury Handbag',
    'Portable Speaker',
    'Fitness Tracker',
    'Running Shoes',
    'Coffee Maker',
  ];

  static const List<String> brands = [
    'Apple',
    'Samsung',
    'Nike',
    'Adidas',
    'Sony',
    'LG',
    'Dell',
    'HP',
  ];

  static const List<String> recentSearches = [
    'Wireless Headphones',
    'Smart Watch',
    'Running Shoes',
    'Laptop',
    'Headphones',
  ];

  static const List<String> suggestions = [
    'iPhone 15 Pro',
    'Air Jordan',
    'MacBook Pro',
    'PlayStation 5',
    'Bose Headphones',
  ];

  static const double borderRadius = 16.0;
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusLarge = 24.0;

  static const double blurSigma = 15.0;
  static const double cardElevation = 0.0;

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration animationDurationLong = Duration(milliseconds: 500);
}

class MockData {
  static final List<Map<String, dynamic>> products = List.generate(
    20,
    (index) => {
      'id': index,
      'name': 'Premium Product ${index + 1}',
      'brand': ['Apple', 'Samsung', 'Nike', 'Sony', 'LG'][index % 5],
      'price': 99.99 + (index * 25),
      'originalPrice': (99.99 + (index * 25)) * 1.3,
      'discount': (index % 4 == 0) ? 20 + (index % 3) * 5 : 0,
      'rating': 3.5 + (index % 3) * 0.5,
      'reviews': 100 + (index * 50),
      'isFavorite': index % 3 == 0,
      'colors': ['Black', 'White', 'Blue', 'Red'][index % 4],
      'sizes': ['S', 'M', 'L', 'XL'][index % 4],
    },
  );

  static final List<Map<String, dynamic>> flashDeals = List.generate(
    10,
    (index) => {
      'id': index,
      'name': 'Flash Deal ${index + 1}',
      'price': 49.99 + (index * 10),
      'originalPrice': (49.99 + (index * 10)) * 2,
      'discount': 50 + (index % 3) * 10,
      'soldPercentage': 30 + (index * 7) % 70,
      'hoursLeft': (index % 3) + 1,
    },
  );

  static final List<Map<String, dynamic>> orders = [
    {
      'id': 'ORD-2024-001',
      'date': '2024-01-15',
      'status': 'Delivered',
      'total': 299.99,
      'items': 3,
    },
    {
      'id': 'ORD-2024-002',
      'date': '2024-01-18',
      'status': 'Shipped',
      'total': 149.99,
      'items': 1,
    },
    {
      'id': 'ORD-2024-003',
      'date': '2024-01-20',
      'status': 'Processing',
      'total': 89.99,
      'items': 2,
    },
    {
      'id': 'ORD-2024-004',
      'date': '2024-01-22',
      'status': 'Cancelled',
      'total': 199.99,
      'items': 1,
    },
  ];

  static final List<Map<String, dynamic>> trackingSteps = [
    {'title': 'Order Placed', 'completed': true, 'time': 'Jan 15, 10:30 AM'},
    {'title': 'Order Confirmed', 'completed': true, 'time': 'Jan 15, 11:45 AM'},
    {'title': 'Shipped', 'completed': true, 'time': 'Jan 16, 09:00 AM'},
    {'title': 'Out for Delivery', 'completed': false, 'time': 'In progress'},
    {'title': 'Delivered', 'completed': false, 'time': 'Expected Jan 18'},
  ];
}
