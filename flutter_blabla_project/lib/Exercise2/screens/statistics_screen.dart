import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/color_counter.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("StatisticsScreen");
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Consumer<ColorCounters>(
          builder: (context, counters, child) {
            print("Statistics data");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red Taps: ${counters.redTapCount}', style: TextStyle(fontSize: 24)),
                Text('Blue Taps: ${counters.blueTapCount}', style: TextStyle(fontSize: 24)),
              ],
            );
          },
        ),
      ),
    );
  }
}