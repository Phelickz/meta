import 'package:flutter/material.dart';

class CustomVerificationIndicator extends StatelessWidget {
  final int currentState;
  final int total;

  const CustomVerificationIndicator(this.currentState, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    double progress = currentState / total;

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: currentState == 1 ? 0.5 : progress,
            strokeWidth: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              currentState == 0
                  ? Colors.transparent
                  : (currentState == total
                      ? Colors.blue
                      : Colors.blue.withOpacity(0.5)),
            ),
          ),
          Text("$currentState/$total",
              style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
