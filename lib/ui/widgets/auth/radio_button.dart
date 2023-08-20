import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/theme.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

  const CustomRadioWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.width = 12,
      this.height = 12});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged(this.value);
        },
        child: Container(
          height: this.height,
          width: this.width,
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: isDarkMode ? Colors.white : Colors.black54,
          ),
          child: Center(
            child: Container(
              height: this.height - 2,
              width: this.width - 2,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                gradient: LinearGradient(
                  colors: value == groupValue
                      ? const [
                          Color(0xFFE13684),
                          Color(0xFFFF6EEC),
                        ]
                      : [
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
