// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/function_calculator.dart';
import 'package:lab15/main.dart';

void main() {
  group('FunctionCalculator', () {
    test('Calculate function for x=2', () {
      final calculator = FunctionCalculator();
      final result = calculator.calculate(2);
      expect(result, 2 - 1 / (2 * 2) + 1 / (3 * 2));
    });

    test('Throw error when x is 0', () {
      final calculator = FunctionCalculator();
      expect(() => calculator.calculate(0), throwsArgumentError);
    });
  });

  testWidgets('CounterPage UI test', (WidgetTester tester) async {
    // Build the CounterPage widget
    await tester.pumpWidget(const MaterialApp(home: CounterPage()));

    expect(find.text('CS-31: Taras\'s last Flutter App'), findsOneWidget);

    expect(find.text('Counter: 0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();

    expect(find.text('Counter: 1'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '2');
    await tester.tap(find.text('Calculate y = f(x)'));
    await tester.pump();

    expect(find.text('Result: 1.5'), findsOneWidget);
  });


}
