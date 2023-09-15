import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/capitalize.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/fund_account/fund_account_view_model.dart';
import 'package:meta_trader/ui/widgets/auth/radio_button.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class SelectDepositMethod extends StatelessWidget {
  const SelectDepositMethod({super.key, required this.model});
  final FundAccountViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 4),
      ),
      child: Column(
        children: [
          verticalSpaceXSmall(context),
          Expanded(
            child: ListView.separated(
              itemCount: DepositMethod.values.length,
              itemBuilder: (context, index) {
                var title = DepositMethod.values[index];
                return depositMethodTile(context, title.name.capitalizeEach(),
                    title, model.depositMethod == title, true, (value) {
                  model.setDepositMethod = title;
                });
              },
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpaceSmall(context);
              },
            ),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              // if (model.depositMethod == DepositMethod.onlineBank) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.onlineBank;
              // }
              // if (model.depositMethod == DepositMethod.binancePay) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.binancePay;
              // }
              // if (model.depositMethod == DepositMethod.bitcoin) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.bitcoin;
              // }
              // if (model.depositMethod == DepositMethod.neteller) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.neteller;
              // }
              // if (model.depositMethod == DepositMethod.perfectMoney) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.perfectMoney;
              // }
              // if (model.depositMethod == DepositMethod.skrill) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.skrill;
              // }
              // if (model.depositMethod == DepositMethod.sticPay) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.sticPay;
              // }
              // if (model.depositMethod == DepositMethod.tether) {
              //   model.setFundAccountPageEnum = FundAccountPageEnum.tether;
              // }

              if (model.depositMethod == DepositMethod.blockBee) {
                model.setFundAccountPageEnum = FundAccountPageEnum.blockBee;
              }
            },
            text: 'Next',
          ),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }

  Widget depositMethodTile(BuildContext context, String title, DepositMethod e,
      bool value, bool groupValue, void Function(bool) onChanged) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Card(
      elevation: 0,
      color: !isDarkMode
          ? value == true
              ? const Color(0xffD3ECFD)
              : Colors.white
          : value == true
              ? const Color(0xff052844)
              : Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: BorderSide(
          color: isDarkMode
              ? Theme.of(context).secondaryHeaderColor.withOpacity(0.3)
              : Theme.of(context).secondaryHeaderColor,
        ),
      ),
      child: SizedBox(
        // height: McGyver.rsDoubleH(context, 18),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: McGyver.rsDoubleW(context, 10),
                  height: McGyver.rsDoubleW(context, 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/blocbee.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2.2),
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? Colors.white
                              : ColorManager.lightText,
                        ),
                      ),
                      verticalSpaceXXSmall(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Average time:',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                          Text(
                            'Instant',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      // verticalSpaceXXSmall(context),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Duration:',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                          Text(
                            'up to 30mins',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fee:',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                          Text(
                            '0%',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Limit:',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                          Text(
                            '10-200,00 USD',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpaceXSmall(context),
              Column(
                children: [
                  // const Spacer(),
                  verticalSpaceSmall(context),
                  verticalSpaceSmall(context),
                  Align(
                    alignment: Alignment.center,
                    child: Transform.scale(
                      scale: McGyver.rsDoubleH(context, 0.24),
                      child: CustomRadioWidget(
                        value: value,
                        groupValue: groupValue,
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                  // const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
