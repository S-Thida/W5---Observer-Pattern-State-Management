import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/color_counter.dart';
import '../widget/color_tap.dart';

class ColorTapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ColorTapsScreen ");
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          Consumer<ColorCounters>(
            builder: (context, counters, child) {
              print("Red ColorTap ");
              return ColorTap(
                type: CardType.red,
                tapCount: counters.redTapCount,
                onTap: counters.incrementRed,
              );
            },
          ),
          Consumer<ColorCounters>(
            builder: (context, counters, child) {
              print("Blue ColorTap ");
              return ColorTap(
                type: CardType.blue,
                tapCount: counters.blueTapCount,
                onTap: counters.incrementBlue,
              );
            },
          ),
        ],
      ),
    );
  }
}
