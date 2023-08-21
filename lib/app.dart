import 'package:flutter/cupertino.dart';
import 'package:snap_convert/features/home/home_screen.dart';
import 'package:snap_convert/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      home: HomeScreen(),
      theme: CupertinoThemeData(brightness: Brightness.light),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
