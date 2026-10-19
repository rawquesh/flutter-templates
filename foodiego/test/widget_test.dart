import 'package:flutter_test/flutter_test.dart';
import 'package:foodiego/main.dart';

void main() {
  testWidgets('FoodieGo app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodieGoApp());
    // NOTE: pumpAndSettle() can't be used here — AnimatedBackground runs an
    // infinitely-repeating AnimationController, so the frame schedule never
    // settles. Pump a few explicit frames instead.
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('FoodieGo'), findsOneWidget);
  });
}
