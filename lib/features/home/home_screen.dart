import 'package:flutter/cupertino.dart';
import 'package:snap_convert/features/ocr_conversion/ocr_conversion_screen.dart';
import 'package:snap_convert/features/text_conversion/text_conversion_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('Currency Converter'),
      // ),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Currency Converter'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Navigate to Settings screen
          },
          child: const Icon(CupertinoIcons.settings),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<Widget>(
                      builder: (context) => TextConversionScreen(),
                    ),
                  );
                },
                color: CupertinoColors.activeBlue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                borderRadius: BorderRadius.circular(8),
                child: const Text('Text Input'),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<Widget>(
                      builder: (context) => const OCRConversionScreen(),
                    ),
                  );
                },
                color: CupertinoColors.activeGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
                borderRadius: BorderRadius.circular(8),
                child: const Text('Camera Input'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
