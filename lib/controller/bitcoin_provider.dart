// import 'package:coin_desk/models/bitcoin.dart';
// import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:coin_desk/models/bitcoin_rate.dart';
import 'package:coin_desk/services/bitcoin.dart';
import 'package:flutter/material.dart';

class BitcoinDataProvider extends ChangeNotifier {
  BitcoinDataProvider() {
    _loadBitcoinData();
  }
  // late Future<BitcoinData> futureBitcoinData;
  final BitcoinService _bitcoinService = BitcoinService();
  late Future<List<BitcoinRate>> futureBitcoinItems;
  List<BitcoinRate> _cachedBitcoinData = [];

  Future<void> _loadBitcoinData() async {
    try {
      if (_cachedBitcoinData.isEmpty) {
        futureBitcoinItems = _bitcoinService.fetchBitcoinPriceData();
        _cachedBitcoinData = await futureBitcoinItems;
        notifyListeners();
      } else {
        futureBitcoinItems = Future.value(_cachedBitcoinData);
      }
    } catch (error) {
      futureBitcoinItems = Future.error('Failed to load Bitcoin data');
      notifyListeners();
    }
  }

  Future<void> refreshBitcoinData() async {
    _cachedBitcoinData.clear();
    await _loadBitcoinData();
  }
}
