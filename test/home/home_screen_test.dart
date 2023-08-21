import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snap_convert/features/text_conversion/text_conversion_screen.dart';

void main() {
  testWidgets('TextConversionScreen has essential elements',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      CupertinoApp(
        home: TextConversionScreen(),
      ),
    );

    // Check for the AppBar title
    expect(find.text('Currency Converter'), findsOneWidget);

    // Check for the placeholder text inside the CupertinoTextField
    expect(find.text('Enter amount'), findsOneWidget);

    // Check for the Result text
    expect(find.text(r'Result: $0.00'), findsOneWidget);

    // Check for the Convert button
    expect(find.widgetWithText(CupertinoButton, 'Convert'), findsOneWidget);

    // Check for the Clear button
    expect(find.widgetWithText(CupertinoButton, 'Clear'), findsOneWidget);

    // Check for currency options (you can add more checks for other currencies)
    expect(find.text('USD'), findsOneWidget);
    expect(find.text('EUR'), findsOneWidget);
    expect(find.text('GBP'), findsOneWidget);
    expect(find.text('CAD'), findsOneWidget);
  });
}
