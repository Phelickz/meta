import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';

class PlusMinusText extends StatefulWidget {
  final String label;
  final String value;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final Function(String) onTextChanged;
  final double? width;
  final bool hasMargin;
  const PlusMinusText({
    super.key,
    required this.value,
    required this.label,
    required this.onPlus,
    required this.onMinus,
    required this.onTextChanged,
    this.width,
    this.hasMargin = true,
  });

  @override
  State<PlusMinusText> createState() => _PlusMinusTextState();
}

class _PlusMinusTextState extends State<PlusMinusText> {
  double value = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.8),
            fontWeight: FontWeight.w500,
            color: isDarkMode
                ? const Color(0xFFD0D5DD)
                : const Color(
                    0xFF667085,
                  ),
          ),
        ),
        verticalSpaceXXSmall(context),
        Container(
          padding: EdgeInsets.all(McGyver.rsDoubleW(context, 4)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(McGyver.rsDoubleW(context, 2)),
            border: Border.all(
                width: 0.3,
                color: isDarkMode
                    ? const Color(0xFF667085)
                    : const Color(0xFF98A2B3)),
          ),
          width: widget.width ?? double.maxFinite,
          child: Row(
            children: [
              InkWell(
                onTap: widget.onMinus,
                child: SizedBox(
                  height: McGyver.rsDoubleH(context, 2.8),
                  width: McGyver.rsDoubleH(context, 2.8),
                  child: SvgPicture.asset(
                    "assets/images/minus.svg",
                    colorFilter: ColorFilter.mode(
                      isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xFF667085),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                widget.value,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.9),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: widget.onPlus,
                child: SizedBox(
                  height: McGyver.rsDoubleH(context, 2.8),
                  width: McGyver.rsDoubleH(context, 2.8),
                  child: SvgPicture.asset(
                    "assets/images/add.svg",
                    colorFilter: ColorFilter.mode(
                      isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xFF667085),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.hasMargin) verticalSpaceSmall(context),
      ],
    );
  }
}
