import 'package:coin_desk/models/bitcoin.dart';
import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:coin_desk/services/bitcoin.dart';
import 'package:flutter/material.dart';

class BitcoinDataProvider extends ChangeNotifier {
  BitcoinDataProvider() {
    futureBitcoinData = _fetchBitcoinData();
    futureBitcoinItems = _fetchBitcoinDatav3();
  }
  late Future<BitcoinData> futureBitcoinData;
  late Future<List<BitcoinDatav3>> futureBitcoinItems;

  Future<List<BitcoinDatav3>> _fetchBitcoinDatav3() async {
    try {
      return BitcoinService().fetchBitcoinDatav3();
    } catch (err) {
      throw Exception('Failed to load Bitcoin data');
    }
  }

  Future<BitcoinData> _fetchBitcoinData() async {
    try {
      return BitcoinService().fetchBitcoinData();
    } catch (err) {
      throw Exception('Failed to load Bitcoin data');
    }
  }
}
