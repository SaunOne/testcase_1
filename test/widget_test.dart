import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App should build successfully', (WidgetTester tester) async {
    // Basic smoke test to verify the app builds
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Flutter Starter Kit'))),
      ),
    );

    expect(find.text('Flutter Starter Kit'), findsOneWidget);
  });
}
