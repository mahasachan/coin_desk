import 'package:coin_desk/controller/bitcoin_provider.dart';
// import 'package:coin_desk/models/bitcoin.dart';
import 'package:coin_desk/models/bitcoin_price_index.dart';
import 'package:coin_desk/widgets/coin_desk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<BitcoinPriceIndexV2>> futureBitcoinItems;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadBitcoinData();
  // }

  // Future<void> _loadBitcoinData() async {
  //   try {
  //     await Provider.of<BitcoinDataProvider>(context, listen: false)
  //         .futureBitcoinItems;
  //   } catch (error) {
  //     throw Exception('Failed to load Bitcoin data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Desk'),
      ),
      body:
          Consumer<BitcoinDataProvider>(builder: (_, bitcoinDataProvider, __) {
        return FutureBuilder(
            future: bitcoinDataProvider.futureBitcoinItems,
            builder: (___, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                    child: Text('Failed to load Bitcoin data ja'));
              }
              final bitcoinData = snapshot.data!;
              return CoinDesk(bitcoinData: bitcoinData);
            });
      }),

      // body: FutureBuilder(
      //     future:
      //         Provider.of<BitcoinDataProvider>(context).futureBitcoinItems,
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         print('loading ja');
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //       if (snapshot.hasError) {
      //         return const Center(
      //             child: Text('Failed to load Bitcoin data ja'));
      //       }
      //       final bitcoinData = snapshot.data!;
      //       return CoinDesk(bitcoinData: bitcoinData);
      //     })
    );
  }
}
