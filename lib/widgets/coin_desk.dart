// import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:coin_desk/models/bitcoin_rate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinDesk extends StatelessWidget {
  const CoinDesk({super.key, required this.bitcoinData});

  final List<BitcoinRate> bitcoinData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Table(
            border: TableBorder.all(
              color: Theme.of(context).colorScheme.primary,
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                children: const [
                  TableCellStyle(
                    title: 'code',
                    textAlign: TextAlign.left,
                  ),
                  TableCellStyle(
                    title: 'Symbol',
                  ),
                  TableCellStyle(
                    title: 'Rate',
                  ),
                  TableCellStyle(title: 'description'),
                  TableCellStyle(
                    title: 'Rate Float',
                  ),
                ],
              ),
              ...List.generate(
                bitcoinData.length,
                (index) => TableRow(children: [
                  TextInRow(
                    bitcoinValueStr: bitcoinData[index].code,
                    textAlign: TextAlign.left,
                  ),
                  TextInRow(
                    bitcoinValueStr: _formatCurrency(bitcoinData[index].code),
                  ),
                  TextInRow(
                    bitcoinValueStr: bitcoinData[index].rate,
                  ),
                  TextInRow(
                    bitcoinValueStr: bitcoinData[index].description,
                  ),
                  TextInRow(
                    bitcoinValueStr: bitcoinData[index].rateFloat.toString(),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCurrency(String codeName) {
    var fomat = NumberFormat.compactSimpleCurrency(name: codeName);
    return fomat.currencySymbol;
  }
}

class TextInRow extends StatelessWidget {
  const TextInRow({
    super.key,
    required this.bitcoinValueStr,
    this.textAlign,
    this.padding,
  });

  final String bitcoinValueStr;
  final TextAlign? textAlign;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: Text(
        bitcoinValueStr,
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }
}

class TableCellStyle extends StatelessWidget {
  const TableCellStyle(
      {super.key,
      required this.title,
      this.fontWeight,
      this.textAlign,
      this.padding,
      this.verticalAlignment});

  final String title;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final TableCellVerticalAlignment? verticalAlignment;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: verticalAlignment ?? TableCellVerticalAlignment.middle,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontWeight: fontWeight ?? FontWeight.bold),
          textAlign: textAlign ?? TextAlign.center,
        )),
      ),
    );
  }
}
