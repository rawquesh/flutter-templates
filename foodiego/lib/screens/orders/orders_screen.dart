import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryOrange,
          unselectedLabelColor: isDark ? Colors.white54 : Colors.black54,
          indicatorColor: AppColors.primaryOrange,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Past Orders'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActiveOrders(isDark),
          _buildPastOrders(isDark),
        ],
      ),
    );
  }

  Widget _buildActiveOrders(bool isDark) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        ActiveOrderCard(
          orderId: 'FG12345',
          restaurantName: 'Pizza Palace',
          status: 'Preparing',
          eta: '25-30 min',
          restaurantGradient: const [Color(0xFFFF9800), Color(0xFFE65100)],
          itemCount: 3,
          total: 42.97,
          stages: const [
            OrderStage(title: 'Confirmed', icon: Icons.check, isCompleted: true),
            OrderStage(title: 'Preparing', icon: Icons.restaurant, isCompleted: true),
            OrderStage(title: 'On the way', icon: Icons.delivery_dining, isCompleted: false),
            OrderStage(title: 'Delivered', icon: Icons.home, isCompleted: false),
          ],
        ),
        ActiveOrderCard(
          orderId: 'FG12344',
          restaurantName: 'Burger Barn',
          status: 'Out for Delivery',
          eta: '10 min',
          restaurantGradient: const [Color(0xFFE53935), Color(0xFFB71C1C)],
          itemCount: 2,
          total: 18.99,
          stages: const [
            OrderStage(title: 'Confirmed', icon: Icons.check, isCompleted: true),
            OrderStage(title: 'Preparing', icon: Icons.restaurant, isCompleted: true),
            OrderStage(title: 'On the way', icon: Icons.delivery_dining, isCompleted: true),
            OrderStage(title: 'Delivered', icon: Icons.home, isCompleted: false),
          ],
        ),
      ],
    );
  }

  Widget _buildPastOrders(bool isDark) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        OrderCard(
          orderId: 'FG12340',
          restaurantName: 'Sushi Supreme',
          date: 'Mar 15, 2024',
          status: 'Delivered',
          restaurantGradient: const [Color(0xFF1976D2), Color(0xFF0D47A1)],
          itemCount: 4,
          total: 56.99,
        ),
        OrderCard(
          orderId: 'FG12335',
          restaurantName: 'Taco Town',
          date: 'Mar 12, 2024',
          status: 'Delivered',
          restaurantGradient: const [Color(0xFFFFB300), Color(0xFFFF8F00)],
          itemCount: 2,
          total: 24.99,
        ),
        OrderCard(
          orderId: 'FG12330',
          restaurantName: 'Curry House',
          date: 'Mar 8, 2024',
          status: 'Delivered',
          restaurantGradient: const [Color(0xFFFF5722), Color(0xFFE64A19)],
          itemCount: 3,
          total: 38.50,
        ),
      ],
    );
  }
}
