import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class WalletBalanceContainer extends StatefulWidget {
  const WalletBalanceContainer({
    super.key,
  });

  @override
  State<WalletBalanceContainer> createState() => _WalletBalanceContainerState();
}

class _WalletBalanceContainerState extends State<WalletBalanceContainer> {
  bool showBalance = true;
  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      color: isDarkMode ? const Color(0xff052844) : const Color(0xff20A0F3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Text(
            "Wallet Balance",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.3),
              fontWeight: FontWeight.w500,
              color: isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
            ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 0.2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    showBalance ? "\$283,500" : "*********",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 3),
                      fontWeight: FontWeight.bold,
                      color:
                          isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
                    ),
                  ),
                  horizontalSpaceXXSmall(context),
                  IconButton(
                      onPressed: () {
                        showBalance = !showBalance;
                        setState(() {});
                      },
                      icon: Icon(
                        !showBalance
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: isDarkMode
                            ? const Color(0xff98A2B3)
                            : const Color(0xFFD3ECFD),
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "30%",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.5),
                      fontWeight: FontWeight.bold,
                      color:
                          isDarkMode ? const Color(0xff94D1F9) : Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 0.2),
                  ),
                  Text(
                    "over 24 Hrs",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.3),
                      fontWeight: FontWeight.w500,
                      color:
                          isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
