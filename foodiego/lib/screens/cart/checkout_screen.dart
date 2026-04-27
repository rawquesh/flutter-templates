import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedTimeSlot = 'ASAP';
  String _selectedTip = '0';
  final List<String> _tips = ['0', '20', '50', '100', 'Custom'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeliveryAddress(isDark),
            const SizedBox(height: 16),
            _buildDeliveryTime(isDark),
            const SizedBox(height: 16),
            _buildPaymentMethod(isDark),
            const SizedBox(height: 16),
            _buildTipSection(isDark),
            const SizedBox(height: 16),
            _buildBillSummary(isDark),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: _buildPlaceOrder(isDark),
    );
  }

  Widget _buildDeliveryAddress(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.primaryOrange),
              const SizedBox(width: 8),
              Text(
                'Delivery Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                ),
              ),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text('Change')),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.home, color: AppColors.successGreen),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : AppColors.textPrimaryLight,
                        ),
                      ),
                      Text(
                        '123 Main Street, Apt 4B',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white70 : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: isDark ? Colors.white24 : Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.note_alt, color: isDark ? Colors.white54 : Colors.black54),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Add delivery instructions',
                    style: TextStyle(
                      color: isDark ? Colors.white38 : Colors.black38,
                    ),
                  ),
                ),
                Icon(Icons.add, color: AppColors.primaryOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryTime(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.access_time, color: AppColors.primaryOrange),
              const SizedBox(width: 8),
              Text(
                'Delivery Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text('ASAP'),
                selected: _selectedTimeSlot == 'ASAP',
                selectedColor: AppColors.primaryOrange.withValues(alpha: 0.2),
                onSelected: (s) => setState(() => _selectedTimeSlot = 'ASAP'),
              ),
              ChoiceChip(
                label: const Text('Schedule'),
                selected: _selectedTimeSlot == 'Schedule',
                selectedColor: AppColors.primaryOrange.withValues(alpha: 0.2),
                onSelected: (s) => setState(() => _selectedTimeSlot = 'Schedule'),
              ),
            ],
          ),
          if (_selectedTimeSlot == 'ASAP') ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer, color: AppColors.primaryOrange),
                  const SizedBox(width: 12),
                  Text(
                    'Estimated arrival: 25-35 min',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.payment, color: AppColors.primaryOrange),
              const SizedBox(width: 8),
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                ),
              ),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text('Add New')),
            ],
          ),
          const SizedBox(height: 12),
          _buildPaymentOption('Credit Card', Icons.credit_card, isDark, isSelected: true),
          _buildPaymentOption('UPI', Icons.qr_code, isDark),
          _buildPaymentOption('Cash on Delivery', Icons.payments_outlined, isDark),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon, bool isDark, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryOrange.withValues(alpha: 0.1)
            : (isDark ? Colors.black26 : Colors.grey.shade100),
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: AppColors.primaryOrange)
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? AppColors.primaryOrange : (isDark ? Colors.white54 : Colors.black54)),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          if (isSelected) ...[
            const Spacer(),
            const Icon(Icons.check_circle, color: AppColors.primaryOrange, size: 20),
          ],
        ],
      ),
    );
  }

  Widget _buildTipSection(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.volunteer_activism, color: AppColors.primaryOrange),
              const SizedBox(width: 8),
              Text(
                'Add a tip',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '100% of your tip goes to the delivery partner',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: _tips.map((tip) {
              final isSelected = _selectedTip == tip;
              return GestureDetector(
                onTap: () => setState(() => _selectedTip = tip),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryOrange.withValues(alpha: 0.2)
                        : (isDark ? Colors.black26 : Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(20),
                    border: isSelected
                        ? Border.all(color: AppColors.primaryOrange)
                        : null,
                  ),
                  child: Text(
                    tip == '0' ? 'No tip' : (tip == 'Custom' ? 'Custom' : '\$$tip'),
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.primaryOrange
                          : (isDark ? Colors.white : AppColors.textPrimaryLight),
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBillSummary(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bill Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow('Item Total', '\$42.97'),
          _buildSummaryRow('Delivery Fee', '\$2.99'),
          _buildSummaryRow('Packaging Fee', '\$0.99'),
          _buildSummaryRow('Taxes', '\$3.44'),
          _buildSummaryRow('Tip', '\$0.00'),
          const Divider(height: 24),
          _buildSummaryRow('Total', '\$50.39', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String amount, {bool isTotal = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal
                  ? (isDark ? Colors.white : AppColors.textPrimaryLight)
                  : (isDark ? Colors.white70 : AppColors.textSecondaryLight),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: isTotal ? AppColors.primaryOrange : (isDark ? Colors.white : AppColors.textPrimaryLight),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceOrder(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: GlassButton(
          text: 'Place Order • \$50.39',
          onPressed: () {},
        ),
      ),
    );
  }
}
