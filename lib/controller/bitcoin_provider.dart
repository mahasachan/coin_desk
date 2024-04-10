// import 'package:coin_desk/models/bitcoin.dart';
import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:coin_desk/services/bitcoin.dart';
import 'package:flutter/material.dart';

class BitcoinDataProvider extends ChangeNotifier {
  BitcoinDataProvider() {
    // futureBitcoinData = _fetchBitcoinData();
    // futureBitcoinItems = _fetchBitcoinPriceIndexData();
    _loadBitcoinData();
  }
  // late Future<BitcoinData> futureBitcoinData;
  final BitcoinService _bitcoinService = BitcoinService();
  late Future<List<BitcoinPriceIndexV2>> futureBitcoinItems;
  List<BitcoinPriceIndexV2> _cachedBitcoinData = [];

  Future<void> _loadBitcoinData() async {
    try {
      if (_cachedBitcoinData.isEmpty) {
        // _cachedBitcoinData = await _bitcoinService.fetchBitcoinPriceData();
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

  // Future<List<BitcoinPriceIndexV2>> _fetchBitcoinPriceIndexData() async {
  //   try {
  //     if (_cachedBitcoinData.isNotEmpty) {
  //       return _cachedBitcoinData;
  //     } else {
  //       _cachedBitcoinData = await BitcoinService().fetchBitcoinPriceData();
  //       return _cachedBitcoinData;
  //     }
  //   } catch (err) {
  //     throw Exception('Failed to load Bitcoin data');
  //   }
  // }

  // Future<BitcoinData> _fetchBitcoinData() async {
  //   try {
  //     return BitcoinService().fetchBitcoinData();
  //   } catch (err) {
  //     throw Exception('Failed to load Bitcoin data');
  //   }
  // }
}
