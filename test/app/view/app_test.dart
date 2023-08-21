import 'package:flutter_test/flutter_test.dart';
import 'package:snap_convert/app.dart';
import 'package:snap_convert/features/home/home_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
