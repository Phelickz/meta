import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/p_modal_bottomsheet.dart';
import 'package:meta_trader/ui/widgets/provider/components/p_profit_bar.dart';
import 'package:meta_trader/ui/widgets/provider/components/p_trade_bar.dart';

class PTradeHistory extends StatelessWidget {
  final ProviderViewModel viewModel;
  const PTradeHistory({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 8.pHeight(context),),
        // const ProfileBar(name: "Adenuga Kolade", job: "Flutter Developer", nationality: "NGR"),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProfitBar(viewModel: viewModel),
        SizedBox(
          height: 20.pHeight(context),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.positions.tr(),
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 16,
                  context: context,
                  fontWeight: FontWeight.w600,
                  lightTextColor: const Color(0xFF475467),
                  darkTextColor: const Color(0xFF98A2B3)),
            ),
            const Spacer(),
            InkWell(
                onTap: () => showBottomSheet(
                    context: context,
                    builder: (_) {
                      return ProviderModalBottomsheet.tradeBottomSheet(
                          viewModel);
                    }),
                // ignore: deprecated_member_use
                child: SvgPicture.asset(
                  AssetManager.filter,
                  // ignore: deprecated_member_use
                  color: const Color(0xFF98A2B3),
                  height: 20,
                  width: 20,
                ))
          ],
        ),
        SizedBox(
          height: 16.pHeight(context),
        ),

        Expanded(
            child: ListView.builder(
                itemCount: viewModel.tradeDetailList.length,
                itemBuilder: (context, index) {
                  return PTradeBar(
                      tradeInfo: viewModel.tradeDetailList[index],
                      showExpandedPositionView:
                          viewModel.showExpandedPositionView);
                }))
      ],
    );
  }
}
