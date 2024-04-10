import 'package:coin_desk/models/bitcoin_rate.dart';

class BitcoinPriceIndex {
  const BitcoinPriceIndex({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  final BitcoinRate usd;
  final BitcoinRate gbp;
  final BitcoinRate eur;

  factory BitcoinPriceIndex.fromJson(Map<String, dynamic> json) {
    return BitcoinPriceIndex(
      usd: BitcoinRate.fromJson(json['USD']),
      gbp: BitcoinRate.fromJson(json['GBP']),
      eur: BitcoinRate.fromJson(json['EUR']),
    );
  }
}

class BitcoinPriceIndexV2 {
  BitcoinPriceIndexV2(
      {required this.code,
      required this.symbol,
      required this.description,
      required this.rate,
      required this.rateFloat});

  final String code;
  final String symbol;
  final String description;
  final double rateFloat;
  final String rate;
}
