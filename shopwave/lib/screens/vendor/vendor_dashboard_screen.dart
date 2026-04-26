import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Seller Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatsOverview(context),
            const SizedBox(height: 24),
            _buildQuickActions(context),
            const SizedBox(height: 24),
            _buildRecentOrders(context),
            const SizedBox(height: 24),
            _buildTopProducts(context),
            const SizedBox(height: 24),
            _buildPendingActions(context),
            const SizedBox(height: 24),
            _buildEarningsSummary(context),
            const SizedBox(height: 24),
            _buildAnalyticsPreview(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsOverview(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final stats = <Map<String, dynamic>>[
      {'label': 'Total Sales', 'value': '\$12,450', 'trend': '+15%', 'isUp': true},
      {'label': 'Orders', 'value': '156', 'trend': '+8%', 'isUp': true},
      {'label': 'Revenue', 'value': '\$8,920', 'trend': '+12%', 'isUp': true},
      {'label': 'Rating', 'value': '4.8', 'trend': '+0.2', 'isUp': true},
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: stats.asMap().entries.map((entry) {
        final stat = entry.value;
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stat['label'],
                style: TextStyle(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stat['value'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: (stat['isUp'] as bool)
                          ? AppColors.success.withValues(alpha: 0.1)
                          : AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          (stat['isUp'] as bool) ? Icons.trending_up : Icons.trending_down,
                          size: 12,
                          color: (stat['isUp'] as bool) ? AppColors.success : AppColors.error,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          stat['trend'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: (stat['isUp'] as bool) ? AppColors.success : AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final actions = <Map<String, dynamic>>[
      {'icon': Icons.add_box, 'label': 'Add Product'},
      {'icon': Icons.receipt_long, 'label': 'View Orders'},
      {'icon': Icons.message, 'label': 'Messages'},
      {'icon': Icons.analytics, 'label': 'Analytics'},
    ];

    return Row(
      children: actions.map((action) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(action['icon'], color: AppColors.primaryBlue),
                  const SizedBox(height: 8),
                  Text(
                    action['label'],
                    style: const TextStyle(fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecentOrders(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final orders = <Map<String, String>>[
      {'id': '#1001', 'product': 'Wireless Headphones', 'buyer': 'John D.', 'amount': '\$149.99', 'status': 'Pending'},
      {'id': '#1002', 'product': 'Smart Watch', 'buyer': 'Sarah M.', 'amount': '\$299.99', 'status': 'Processing'},
      {'id': '#1003', 'product': 'Running Shoes', 'buyer': 'Mike R.', 'amount': '\$89.99', 'status': 'Shipped'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Orders', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: orders.asMap().entries.map((entry) {
              final order = entry.value;
              final isLast = entry.key == orders.length - 1;
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.shopping_bag_outlined, color: AppColors.primaryBlue, size: 20),
                    ),
                    title: Text(order['product']!),
                    subtitle: Text('${order['id']} - ${order['buyer']}'),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(order['amount']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(order['status']!, style: TextStyle(fontSize: 12, color: AppColors.warning)),
                      ],
                    ),
                  ),
                  if (!isLast) const Divider(height: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTopProducts(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top Products', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildProductRow('Wireless Headphones', '1.2K views', '89 orders', '12%'),
              const Divider(height: 24),
              _buildProductRow('Smart Watch Pro', '980 views', '67 orders', '8%'),
              const Divider(height: 24),
              _buildProductRow('Running Shoes', '850 views', '45 orders', '5%'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductRow(String name, String views, String orders, String conversion) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.shopping_bag_outlined, color: AppColors.primaryBlue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
              Text(views, style: TextStyle(fontSize: 12, color: AppColors.textSecondaryLight)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(orders, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text('Conv: $conversion', style: TextStyle(fontSize: 12, color: AppColors.success)),
          ],
        ),
      ],
    );
  }

  Widget _buildPendingActions(BuildContext context) {
    final actions = <Map<String, dynamic>>[
      {'label': 'Orders to Process', 'count': '3', 'color': AppColors.warning},
      {'label': 'Low Stock', 'count': '5', 'color': AppColors.error},
      {'label': 'Reviews to Respond', 'count': '2', 'color': AppColors.primaryBlue},
      {'label': 'Messages', 'count': '7', 'color': AppColors.success},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pending Actions', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          children: actions.map((action) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (action['color'] as Color).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      action['count'] as String,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: action['color'] as Color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      action['label'] as String,
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildEarningsSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: AppColors.gradientPrimary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Earnings Summary', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("This Week", style: TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 4),
                    const Text('\$2,450', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pending Payout", style: TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 4),
                    const Text('\$850', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Lifetime Earnings", style: TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 4),
                    const Text('\$45,280', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text('Withdraw'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsPreview(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
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
              Text('Analytics Preview', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('View Full')),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.show_chart, size: 48, color: AppColors.primaryBlue.withValues(alpha: 0.5)),
                  const SizedBox(height: 8),
                  Text('Sales Chart', style: TextStyle(color: AppColors.textSecondaryLight)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
