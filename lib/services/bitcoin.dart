import 'dart:convert';
import 'package:coin_desk/models/bitcoin.dart';
import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:http/http.dart' as http;

class BitcoinService {
  Future<BitcoinData> fetchBitcoinData() async {
    final url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json');
    final response =
        await http.get(url, headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      return BitcoinData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Bitcoin data');
    }
  }

  Future<List<BitcoinDatav3>> fetchBitcoinDatav3() async {
    List<BitcoinDatav3> bitcoinItemsV3 = [];
    final url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json');
    final response =
        await http.get(url, headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      // print(response.body);
      final Map<String, dynamic> json = jsonDecode(response.body);
      for (final item in json.entries) {
        if (item.key == "bpi") {
          final Map<String, dynamic> bpi = item.value;
          for (final bpiItem in bpi.entries) {
            final Map<String, dynamic> currency = bpiItem.value;
            final String code = currency['code'];
            final String symbol = currency['symbol'];
            final String rate = currency['rate'];
            final String description = currency['description'];
            final double rateFloat = currency['rate_float'];
            bitcoinItemsV3.add(BitcoinDatav3(
                code: code,
                rate: rate,
                symbol: symbol,
                description: description,
                rateFloat: rateFloat));
          }
          return bitcoinItemsV3;
        }
      }
      return bitcoinItemsV3;
      // return BitcoinData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Bitcoin datav3');
    }
  }
}
