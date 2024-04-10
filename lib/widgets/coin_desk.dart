import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinDesk extends StatelessWidget {
  const CoinDesk({super.key, required this.databit});

  final List<BitcoinPriceIndexV2> databit;

  String _formatCurrency(String codeName) {
    var fomat = NumberFormat.compactSimpleCurrency(name: codeName);
    return fomat.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
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
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Code'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('symbol'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('Rate')),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('Description')),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('Rate float')),
                    ),
                  ),
                ],
              ),
              ...List.generate(
                databit.length,
                (index) => TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(databit[index].code),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_formatCurrency(databit[index].code)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        databit[index].rate,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(databit[index].description,
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        databit[index].rateFloat.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
