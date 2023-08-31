import 'package:flutter/cupertino.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class TradeBulkOperationModal extends StatelessWidget {
  const TradeBulkOperationModal({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 58),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleH(context, 2),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: Column(
        children: [
          Text(
            "Bulk Operations",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.7),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF98A2B3),
            ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 0.5),
          ),
          Text(
            "#1345234 Buy 10 AUDJPYs 1.09625",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: const Color(0xFF98A2B3),
            ),
          ),
          verticalSpaceSmall(context),
          _buttonText(
            context: context,
            label: "Close all positions",
            onTap: () {},
          ),
          _buttonText(
            context: context,
            label: "Close profitable positions",
            onTap: () {},
          ),
          _buttonText(
            context: context,
            label: "Close losing positions",
            onTap: () {},
          ),
          _buttonText(
            context: context,
            label: "Close Buy positions",
            onTap: () {},
          ),
          _buttonText(
            context: context,
            label: "Close AUDJPYs positions",
            onTap: () {},
          ),
          _buttonText(
            context: context,
            label: "Reverse AUDJPY buy",
            onTap: () {},
          ),
          verticalSpaceSmall(context),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
            text: "Cancel",
            color:
                isDarkMode ? const Color(0xFF052844) : const Color(0xFFD3ECFD),
            textColor:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
        ],
      ),
    );
  }

  Widget _buttonText({
    required BuildContext context,
    required String label,
    required Function() onTap,
  }) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Text(
            label,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF97066)),
          ),
        ],
      ),
    );
  }
}