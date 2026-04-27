import 'package:flutter_test/flutter_test.dart';
import 'package:foodiego/main.dart';

void main() {
  testWidgets('FoodieGo app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodieGoApp());
    await tester.pumpAndSettle();

    expect(find.text('FoodieGo'), findsOneWidget);
  });
}
