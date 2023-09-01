import 'package:flutter/material.dart';

class ChartComponent extends StatelessWidget {
  const ChartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text("Chart component"),
          ),
        )
      ],
    );
  }
}
