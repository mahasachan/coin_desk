class BitcoinRate {
  const BitcoinRate({
    required this.symbol,
    required this.rate,
    required this.description,
    required this.code,
    required this.rateFloat,
  });

  final String rate;
  final String symbol;
  final String description;
  final String code;
  final double rateFloat;

  factory BitcoinRate.fromJson(Map<String, dynamic> json) {
    return BitcoinRate(
      rate: json['rate'],
      symbol: json['symbol'],
      description: json['description'],
      code: json['code'],
      rateFloat: json['rate_float'],
    );
  }
}
