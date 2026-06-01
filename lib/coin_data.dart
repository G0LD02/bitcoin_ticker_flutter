import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {

  Future<double> getBtcPrice(String currency) async {
    const apiKey = '2374583b-9684-4683-b113-5f8fdaed472b';

    final response = await http.get(
      Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$currency',
      ),
      headers: {
        'X-CoinAPI-Key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['rate'];
    } else {
      throw Exception('Failed to load BTC price');
    }
  }
  Future<double> getEthPrice(String currency) async {
    const apiKey = '2374583b-9684-4683-b113-5f8fdaed472b';

    final response = await http.get(
      Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/ETH/$currency',
      ),
      headers: {
        'X-CoinAPI-Key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['rate'];
    } else {
      throw Exception('Failed to load ETH price');
    }
  }
  Future<double> getLtcPrice(String currency) async {
    const apiKey = '2374583b-9684-4683-b113-5f8fdaed472b';

    final response = await http.get(
      Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/LTC/$currency',
      ),
      headers: {
        'X-CoinAPI-Key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['rate'];
    } else {
      throw Exception('Failed to load LTC price');
    }
  }
}

