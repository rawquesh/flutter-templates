import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'glass_badge.dart';

class ComparisonTable extends StatelessWidget {
  final List<ComparisonProduct> products;
  final List<String> features;
  final ComparisonFeature Function(String feature, List<ComparisonProduct> products)?
      getFeatureValue;

  const ComparisonTable({
    super.key,
    required this.products,
    required this.features,
    this.getFeatureValue,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 24,
        headingRowColor: WidgetStateProperty.all(
          isDark
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.grey.withValues(alpha: 0.1),
        ),
        columns: [
          const DataColumn(
            label: SizedBox(
              width: 100,
              child: Text(
                'Feature',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ...products.map((product) => DataColumn(
                label: SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      if (product.badge != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: GlassBadge(
                            text: product.badge!,
                            backgroundColor: _getBadgeColor(product.badge!),
                          ),
                        ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryBlue.withValues(alpha: 0.1),
                              AppColors.accentCoral.withValues(alpha: 0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.primaryBlue.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )),
        ],
        rows: features.map((feature) {
          final featureData = getFeatureValue?.call(feature, products);
          return DataRow(
            cells: [
              DataCell(
                SizedBox(
                  width: 100,
                  child: Text(
                    feature,
                    style: TextStyle(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ),
              ...products.map((product) {
                final value = featureData?.values[products.indexOf(product)];
                final isHighlighted = featureData?.highlightedIndex ==
                    products.indexOf(product);

                return DataCell(
                  SizedBox(
                    width: 120,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: isHighlighted
                          ? BoxDecoration(
                              color: AppColors.success.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            )
                          : null,
                      child: Text(
                        value ?? '-',
                        style: TextStyle(
                          fontWeight:
                              isHighlighted ? FontWeight.bold : FontWeight.normal,
                          color: isHighlighted
                              ? AppColors.success
                              : (isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        }).toList(),
      ),
    );
  }

  Color _getBadgeColor(String badge) {
    switch (badge) {
      case 'Best Value':
        return AppColors.success;
      case 'Best Rated':
        return AppColors.primaryBlue;
      case 'Best Seller':
        return AppColors.warning;
      default:
        return AppColors.primaryBlue;
    }
  }
}

class ComparisonProduct {
  final String id;
  final String name;
  final String? imageUrl;
  final String? badge;

  const ComparisonProduct({
    required this.id,
    required this.name,
    this.imageUrl,
    this.badge,
  });
}

class ComparisonFeature {
  final Map<int, String> values;
  final int? highlightedIndex;

  const ComparisonFeature({
    required this.values,
    this.highlightedIndex,
  });
}
