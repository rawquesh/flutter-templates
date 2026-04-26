import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/gift_card_design.dart';

class GiftCardsScreen extends StatefulWidget {
  const GiftCardsScreen({super.key});

  @override
  State<GiftCardsScreen> createState() => _GiftCardsScreenState();
}

class _GiftCardsScreenState extends State<GiftCardsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  GiftCardTheme _selectedTheme = GiftCardTheme.classic;
  String _selectedAmount = '\$50';
  final _codeController = TextEditingController();

  final List<String> _amounts = ['\$25', '\$50', '\$100', '\$200'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Gift Cards'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Buy'),
            Tab(text: 'Redeem'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBuySection(isDark),
          _buildRedeemSection(isDark),
          _buildHistorySection(isDark),
        ],
      ),
    );
  }

  Widget _buildBuySection(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GiftCardDesign(
              amount: _selectedAmount.replaceAll('\$', ''),
              theme: _selectedTheme,
              message: 'A gift for you!',
              recipientName: 'Friend',
            ),
          ),
          const SizedBox(height: 24),
          Text('Choose Design', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GiftCardSelector(
            selectedTheme: _selectedTheme,
            onThemeSelected: (theme) => setState(() => _selectedTheme = theme),
          ),
          const SizedBox(height: 24),
          Text('Select Amount', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _amounts.map((amount) {
              final isSelected = amount == _selectedAmount;
              return GestureDetector(
                onTap: () => setState(() => _selectedAmount = amount),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryBlue : (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppColors.primaryBlue : Colors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    amount,
                    style: TextStyle(
                      color: isSelected ? Colors.white : null,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text('Recipient Details', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Recipient Name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Personal Message',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Text('Add to Cart - $_selectedAmount'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRedeemSection(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.card_giftcard, size: 48, color: AppColors.primaryBlue),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your Balance',
                  style: TextStyle(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$150.00',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    labelText: 'Enter Gift Card Code',
                    hintText: 'XXXX-XXXX-XXXX',
                    prefixIcon: const Icon(Icons.confirmation_number_outlined),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.check_circle_outline),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Redeem Code'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorySection(bool isDark) {
    final receivedCards = [
      {'from': 'John Doe', 'amount': '\$50', 'date': 'Jan 15, 2024'},
      {'from': 'Mom', 'amount': '\$100', 'date': 'Jan 10, 2024'},
    ];
    final sentCards = [
      {'to': 'Sarah Smith', 'amount': '\$25', 'date': 'Jan 12, 2024', 'status': 'Delivered'},
    ];

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: isDark ? Colors.white70 : Colors.black54,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              tabs: const [
                Tab(text: 'Received'),
                Tab(text: 'Sent'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildCardList(receivedCards, true, isDark),
                _buildCardList(sentCards, false, isDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardList(List<Map<String, String>> cards, bool isReceived, bool isDark) {
    if (cards.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: isDark ? Colors.white24 : Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'No ${isReceived ? 'received' : 'sent'} gift cards',
              style: TextStyle(color: isDark ? Colors.white54 : Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppColors.gradientPrimary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.card_giftcard, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isReceived ? 'From: ${card['from']}' : 'To: ${card['to']}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      card['date']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    card['amount']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  if (!isReceived)
                    Text(
                      card['status']!,
                      style: TextStyle(fontSize: 12, color: AppColors.success),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
