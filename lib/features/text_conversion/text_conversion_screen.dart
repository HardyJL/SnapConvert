import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:snap_convert/features/shared/exchange_rates.dart';

class TextConversionScreen extends StatelessWidget {
  TextConversionScreen({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Currency Converter'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.left_chevron,
            color: CupertinoColors.activeBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CupertinoTextField(
                controller: textController,
                placeholder: 'Enter amount',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              const Text(
                r'Result: $0.00',
              ), // Placeholder for the conversion result
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 32,
                      onSelectedItemChanged: (int index) {},
                      children: const [
                        Text('USD'),
                        Text('EUR'),
                        // Add other currency options here
                      ],
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 32,
                      onSelectedItemChanged: (int index) {},
                      children: const [
                        Text('GBP'),
                        Text('CAD'),
                        // Add other currency options here
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      child: const Text('Convert'),
                      onPressed: () async {
                        final result = await fetchAllCurrencies();
                        log(result.toString());
                      },
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: textController.clear,
                      child: const Text('Clear'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
