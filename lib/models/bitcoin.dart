import 'package:coin_desk/models/bitcoin_price_index.dart';

class Time {
  const Time(this.updated, this.updatedISO, this.updateduk);

  final String updated;
  final String updatedISO;
  final String updateduk;
}

class BitcoinData {
  BitcoinData({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  final Time time;
  final String disclaimer;
  final String chartName;
  final BitcoinPriceIndex bpi;

  factory BitcoinData.fromJson(Map<String, dynamic> json) {
    return BitcoinData(
      time: Time(
        json['time']['updated'],
        json['time']['updatedISO'],
        json['time']['updateduk'],
      ),
      disclaimer: json['disclaimer'],
      chartName: json['chartName'],
      bpi: BitcoinPriceIndex.fromJson(json['bpi']),
    );
  }
}
