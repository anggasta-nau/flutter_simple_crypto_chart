import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(CryptoCoinApp());
}

class CryptoCoinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Coins',
      home: CryptoCoinList(),
    );
  }
}

class CryptoCoinList extends StatelessWidget {
  final List<Map<String, dynamic>> cryptoCoins = [
    {
      'name': 'Bitcoin',
      'price': 45000.0,
      'chartData': [
        0.2,
        0.3,
        0.1,
        0.4,
        0.3,
        0.2,
        0.3,
        0.4,
        0.3,
        0.2,
        0.3,
        0.2,
        0.1,
        0.2,
        0.3,
        0.4,
        0.3,
        0.2,
        0.1,
        0.2,
        0.3,
        0.2,
        0.1,
        0.2
      ],
      'percentChange': 2.5
    },
    {
      'name': 'Ethereum',
      'price': 3300.0,
      'chartData': [
        0.3,
        0.2,
        0.4,
        0.2,
        0.5,
        0.4,
        0.3,
        0.2,
        0.5,
        0.4,
        0.3,
        0.2,
        0.4,
        0.3,
        0.2,
        0.5,
        0.4,
        0.3,
        0.2,
        0.5,
        0.4,
        0.3,
        0.2,
        0.1
      ],
      'percentChange': -1.8
    },
    // Tambahkan data koin kripto lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Coins'),
      ),
      body: ListView.builder(
        itemCount: cryptoCoins.length,
        itemBuilder: (context, index) {
          final coin = cryptoCoins[index];
          final chartData = coin['chartData'] as List<double>;
          final percentChange = coin['percentChange'] as double;

          return Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coin['name']),
                      Text('\$${coin['price']}'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 200, // Atur ketinggian sesuai kebutuhan Anda
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        minX: 0,
                        maxX: 23, // Sesuaikan ini dengan jumlah data (0-23)
                        minY: 0,
                        maxY: 0.5,
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(
                              chartData.length,
                              (i) => FlSpot(i.toDouble(), chartData[i]),
                            ),
                            isCurved: true,
                            color: Colors.blue,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${percentChange.toStringAsFixed(2)}%'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
