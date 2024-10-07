import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart'; // Pastikan ini mengarah ke main.dart yang tepat

void main() {
  testWidgets('Form validation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Find the First Name field and enter text
    await tester.enterText(find.byType(TextFormField).at(0), 'John');
    await tester.enterText(find.byType(TextFormField).at(1), 'Doe');

    // Find and enter Email and Password
    await tester.enterText(find.byType(TextFormField).at(2), 'john.doe@example.com');
    await tester.enterText(find.byType(TextFormField).at(3), '123456');

    // Find Phone Number and Address fields
    await tester.enterText(find.byType(TextFormField).at(4), '1234567890');
    await tester.enterText(find.byType(TextFormField).at(5), '123 Main St');

    // Find Username and Confirm Password fields
    await tester.enterText(find.byType(TextFormField).at(6), 'johndoe');
    await tester.enterText(find.byType(TextFormField).at(7), '123456');

    // Tap the submit button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Check if the expected behavior occurs (e.g., a SnackBar shows up)
    expect(find.text('Processing Data'), findsOneWidget);
  });
}
