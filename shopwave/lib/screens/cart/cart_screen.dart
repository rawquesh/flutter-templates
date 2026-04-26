import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  final int cartCount;

  const CartScreen({super.key, required this.cartCount});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: Text('Shopping Cart ($cartCount)'),
      ),
      body: _buildCartContent(context),
      bottomNavigationBar: _buildCheckoutBar(context),
    );
  }

  Widget _buildCartContent(BuildContext context) {
    final cartItems = <Map<String, dynamic>>[
      {'name': 'Premium Wireless Headphones', 'variant': 'Black, Size: M', 'price': 149.99, 'quantity': 1},
      {'name': 'Smart Watch Pro', 'variant': 'Silver, 44mm', 'price': 299.99, 'quantity': 2},
      {'name': 'Designer Sneakers', 'variant': 'White, Size: 10', 'price': 129.99, 'quantity': 1},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartItemCard(
                name: item['name'] as String,
                variant: item['variant'] as String,
                price: item['price'] as double,
                quantity: item['quantity'] as int,
              );
            },
          ),
          const SizedBox(height: 24),
          _buildPromoCodeSection(context),
          const SizedBox(height: 24),
          _buildPriceSummary(context),
        ],
      ),
    );
  }

  Widget _buildPromoCodeSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer, color: AppColors.primaryBlue),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter promo code',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSummary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPriceRow('Subtotal', '\$579.97'),
          const SizedBox(height: 12),
          _buildPriceRow('Shipping', 'Free'),
          const SizedBox(height: 12),
          _buildPriceRow('Discount', '-\$50.00'),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '\$529.97',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondaryLight,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Proceed to Checkout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
