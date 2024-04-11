import 'dart:convert';
// import 'package:coin_desk/models/bitcoin.dart';
// import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:coin_desk/models/bitcoin_rate.dart';
import 'package:http/http.dart' as http;

class BitcoinService {
  Future<List<BitcoinRate>> fetchBitcoinPriceData() async {
    List<BitcoinRate> bitcoinItems = [];
    final url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json');
    final response =
        await http.get(url, headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      final Map<String, dynamic> mapDataBitcoin = jsonDecode(response.body);
      final MapEntry<String, dynamic> mapBitcoinPriceIndex =
          mapDataBitcoin.entries.firstWhere((element) => element.key == "bpi");

      mapBitcoinPriceIndex.value.entries.forEach((element) {
        // bitcoinItems.add(BitcoinRate(
        //     code: element.value['code'],
        //     rate: element.value['rate'],
        //     symbol: element.value['symbol'],
        //     description: element.value['description'],
        //     rateFloat: element.value['rate_float']));
        bitcoinItems.add(BitcoinRate.fromJson(element.value));
      });
      return bitcoinItems;
    } else {
      throw Exception('Failed to load Bitcoin data');
    }
  }
}
