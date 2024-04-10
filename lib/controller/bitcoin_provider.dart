// import 'package:coin_desk/models/bitcoin.dart';
import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:coin_desk/services/bitcoin.dart';
import 'package:flutter/material.dart';

class BitcoinDataProvider extends ChangeNotifier {
  BitcoinDataProvider() {
    // futureBitcoinData = _fetchBitcoinData();
    futureBitcoinItems = _fetchBitcoinDatav2();
  }
  // late Future<BitcoinData> futureBitcoinData;
  late Future<List<BitcoinPriceIndexV2>> futureBitcoinItems;
  List<BitcoinPriceIndexV2> _cachedBitcoinData = [];

  Future<List<BitcoinPriceIndexV2>> _fetchBitcoinDatav2() async {
    try {
      if (_cachedBitcoinData.isNotEmpty) {
        return _cachedBitcoinData;
      } else {
        _cachedBitcoinData = await BitcoinService().fetchBitcoinDatav2();
        return _cachedBitcoinData;
      }
    } catch (err) {
      throw Exception('Failed to load Bitcoin data');
    }
  }

  // Future<BitcoinData> _fetchBitcoinData() async {
  //   try {
  //     return BitcoinService().fetchBitcoinData();
  //   } catch (err) {
  //     throw Exception('Failed to load Bitcoin data');
  //   }
  // }
}
