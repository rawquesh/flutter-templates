import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_badge.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('My Orders'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList('active', isDark),
          _buildOrderList('completed', isDark),
          _buildOrderList('cancelled', isDark),
        ],
      ),
    );
  }

  Widget _buildOrderList(String status, bool isDark) {
    final orders = _getOrdersForStatus(status);

    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: isDark ? Colors.white24 : Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'No $status orders',
              style: TextStyle(
                color: isDark ? Colors.white54 : Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(order, isDark);
      },
    );
  }

  List<Map<String, dynamic>> _getOrdersForStatus(String status) {
    switch (status) {
      case 'active':
        return [
          {'id': 'ORD-2024-001', 'date': 'Jan 20, 2024', 'status': 'Processing', 'total': 149.99, 'items': 2},
          {'id': 'ORD-2024-002', 'date': 'Jan 18, 2024', 'status': 'Shipped', 'total': 299.99, 'items': 1},
        ];
      case 'completed':
        return [
          {'id': 'ORD-2024-003', 'date': 'Jan 15, 2024', 'status': 'Delivered', 'total': 89.99, 'items': 1},
          {'id': 'ORD-2024-004', 'date': 'Jan 10, 2024', 'status': 'Delivered', 'total': 199.99, 'items': 3},
        ];
      case 'cancelled':
        return [
          {'id': 'ORD-2024-005', 'date': 'Jan 5, 2024', 'status': 'Cancelled', 'total': 59.99, 'items': 1},
        ];
      default:
        return [];
    }
  }

  Widget _buildOrderCard(Map<String, dynamic> order, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order['id'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Placed on ${order['date']}',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              GlassStatusBadge(status: order['status']),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.shopping_bag_outlined, color: AppColors.primaryBlue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${order['items']} item${(order['items'] as int) > 1 ? 's' : ''}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Total: \$${order['total'].toStringAsFixed(2)}',
                      style: TextStyle(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (order['status'] == 'Shipped')
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Track Order'),
                  ),
                ),
              if (order['status'] == 'Shipped') const SizedBox(width: 12),
              if (order['status'] == 'Delivered')
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Reorder'),
                  ),
                ),
              if (order['status'] == 'Delivered') const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('View Details'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
