import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:snap_convert/keys.dart';

Future<Map<String, dynamic>> fetchExchangeRates(
  String currencyBase,
  String currencyConversion,
) async {
  if (currencyBase.isEmpty || currencyBase.length != 3) {
    throw Exception('Invalid base currency');
  }
  if (currencyConversion.isEmpty || currencyConversion.length != 3) {
    throw Exception('Invalid conversion currency');
  }
  final apiUrl =
      'https://openexchangerates.org/api/latest.json?app_id=$openExchangeRatesApiKey&base=${currencyBase.toUpperCase()}&symbols=${currencyConversion.toUpperCase()}';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
    final rates = jsonResponse['rates'];
    return rates as Map<String, dynamic>;
    // return response.body cast into the right type
  } else {
    throw Exception('Failed to fetch exchange rates');
  }
}

Future<Map<String, String>> fetchAllCurrencies() async {
  const apiUrl =
      'https://openexchangerates.org/api/currencies.json?app_id=$openExchangeRatesApiKey';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final currencies = Map<String, String>.from(
      json.decode(response.body) as Map<String, dynamic>,
    );
    return currencies;
  } else {
    throw Exception('Failed to fetch currencies');
  }
}
