import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/trade/trade_view_model.dart';
import 'package:meta_trader/ui/widgets/trade/components/trade_header_details.dart';
import 'package:meta_trader/ui/widgets/trade/components/trade_tile.dart';
import '../../../app/responsiveness/size.dart';
import 'components/position_modal.dart';

class TradePage extends StatelessWidget {
  final TradeViewModel viewModel;
  const TradePage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        TradeHeaderDetails(
          viewModel: viewModel,
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Positions",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF667085)),
              ),
              GestureDetector(
                onTap: () {
                  showPositionModal(context);
                },
                child: SvgPicture.asset(
                  "assets/images/more.svg",
                  colorFilter: ColorFilter.mode(
                    isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xFF667085),
                    BlendMode.srcIn,
                  ),
                ),
              )
            ],
          ),
        ),
        verticalSpaceXSmall(context),
        if (!viewModel.isEmpty)
          Expanded(
            child: ListView(
              children: [
                TradeTile(
                  tradeType: TradeType.buy,
                  viewModel: viewModel,
                ),
                TradeTile(
                  tradeType: TradeType.sell,
                  viewModel: viewModel,
                ),
              ],
            ),
          ),
      ],
    );
  }

  void showPositionModal(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    showModalBottomSheet(
        backgroundColor:
            isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
            topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
          ),
        ),
        context: context,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return const PositionModal();
        });
  }
}

// class TradePage extends StatelessWidget {
//   final TradeViewModel viewModel;
//   const TradePage({
//     super.key,
//     required this.viewModel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var isDarkMode = CustomThemeData.isDarkMode(context);
//     return FadeScrollAppBar(
//       elevation: 0,
//       scrollController: viewModel.scrollController,
//       backgroundColor: isDarkMode
//           ? const Color(0xff052844)
//           : Theme.of(context).primaryColor.withOpacity(0.2),
//       // backgroundColor: isDarkMode
//       //     ? const Color(0xff052844)
//       //     : Theme.of(context).primaryColor.withOpacity(0.3),
//       appBarActions: [
//         // if (assetName != "")
//         IconButton(
//           onPressed: () {
//             // showFilterModal(context);
//           },
//           icon: SizedBox(
//             height: McGyver.rsDoubleH(context, 2.8),
//             width: McGyver.rsDoubleH(context, 2.8),
//             child: SvgPicture.asset(
//               'assets/images/sort.svg',
//               colorFilter: ColorFilter.mode(
//                 isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
//                 BlendMode.srcIn,
//               ),
//             ),
//           ),
//         ),
//       ],
//       appBarTitle: Text(
//         "16 701.47 USD",
//         style: CustomThemeData.generateStyle(
//           fontSize: McGyver.textSize(context, 2),
//           fontWeight: FontWeight.bold,
//           color: viewModel.isBuy
//               ? Theme.of(context).primaryColor
//               : isDarkMode
//                   ? const Color(0xFFF97066)
//                   : const Color(0xFFF04438),
//         ),
//       ),
//       appBarForegroundColor: Colors.amber,

//       pinned: true,
//       appBarShape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
//       ),
//       fadeOffset: 120,
//       expandedHeight: 270,
//       fadeWidget: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [sliverBody(context)],
//       ),
//       bottomWidgetHeight: McGyver.rsDoubleH(context, 12),
//       bottomWidget: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (viewModel.hasCredit)
//             Expanded(
//               child: twoTextBelow(
//                 context,
//                 "Credit",
//                 "100 000.00",
//               ),
//             ),
//           if (viewModel.hasCredit) divider(context),
//           Expanded(
//             child: twoTextBelow(
//               context,
//               "Margin",
//               "113 436.65",
//             ),
//           ),
//           divider(context),
//           Expanded(
//             child: twoTextBelow(
//               context,
//               "Free Margin",
//               viewModel.isEmpty ? "-" : "478 944.06",
//             ),
//           ),
//           divider(context),
//           Expanded(
//             child: twoTextBelow(
//               context,
//               "Margin Level",
//               viewModel.isEmpty ? "-" : "522.21%",
//             ),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // TradeHeaderDetails(
//           //   viewModel: viewModel,
//           // ),
//           verticalSpaceSmall(context),
//           verticalSpaceXSmall(context),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: McGyver.rsDoubleW(context, 6),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Positions",
//                   style: CustomThemeData.generateStyle(
//                       fontSize: McGyver.textSize(context, 1.8),
//                       fontWeight: FontWeight.bold,
//                       color: isDarkMode
//                           ? const Color(0xFF98A2B3)
//                           : const Color(0xFF667085)),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     showPositionModal(context);
//                   },
//                   child: SvgPicture.asset(
//                     "assets/images/more.svg",
//                     colorFilter: ColorFilter.mode(
//                       isDarkMode
//                           ? const Color(0xff98A2B3)
//                           : const Color(0xFF667085),
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           verticalSpaceXSmall(context),
//           if (!viewModel.isEmpty)
//             Expanded(
//               // height: McGyver.rsDoubleH(context, 18),
//               // width: McGyver.rsDoubleW(context, 100),
//               child: ListView(
//                 children: [
//                   TradeTile(
//                     tradeType: TradeType.buy,
//                     viewModel: viewModel,
//                   ),
//                   TradeTile(
//                     tradeType: TradeType.sell,
//                     viewModel: viewModel,
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget sliverBody(BuildContext context) {
//     var isDarkMode = CustomThemeData.isDarkMode(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           verticalSpaceSmall(context),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Balance",
//                 style: CustomThemeData.generateStyle(
//                   fontSize: McGyver.textSize(context, 1.4),
//                   fontWeight: FontWeight.w500,
//                   color: isDarkMode
//                       ? const Color(0xFF98A2B3)
//                       : const Color(0xFF667085),
//                 ),
//               ),
//               Text(
//                 "Equity",
//                 style: CustomThemeData.generateStyle(
//                   fontSize: McGyver.textSize(context, 1.4),
//                   fontWeight: FontWeight.w500,
//                   color: isDarkMode
//                       ? const Color(0xFF98A2B3)
//                       : const Color(0xFF667085),
//                 ),
//               ),
//             ],
//           ),
//           verticalSpaceXSmall(context),
//           Row(
//             // mainAxisAlignment: MainAxisAlignment,
//             children: [
//               Text(
//                 "\$509 082.18",
//                 style: CustomThemeData.generateStyle(
//                   fontSize: McGyver.textSize(context, 2.1),
//                   fontWeight: FontWeight.bold,
//                   color: isDarkMode
//                       ? const Color(0xFF94D1F9)
//                       : const Color(0xFF47B0F5),
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 "\$592 380.17",
//                 style: CustomThemeData.generateStyle(
//                   fontSize: McGyver.textSize(context, 2.1),
//                   fontWeight: FontWeight.bold,
//                   color: isDarkMode
//                       ? const Color(0xFFD0D5DD)
//                       : const Color(0xFF475467),
//                 ),
//               ),
//             ],
//           ),
//           verticalSpaceSmall(context),
//           twoTextPercent(context)
//         ],
//       ),
//     );
//   }

//   Widget divider(BuildContext context) {
//     var isDarkMode = CustomThemeData.isDarkMode(context);
//     return Container(
//       height: McGyver.rsDoubleH(context, 3.6),
//       width: 1,
//       color: isDarkMode ? const Color(0xFF667085) : const Color(0xFF98A2B3),
//     );
//   }

//   Widget twoTextBelow(BuildContext context, String title, String subtitle) {
//     var isDarkMode = CustomThemeData.isDarkMode(context);
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: CustomThemeData.generateStyle(
//               fontSize: McGyver.textSize(context, 1.3),
//               fontWeight: FontWeight.w500,
//               color: isDarkMode
//                   ? const Color(0xFFD0D5DD)
//                   : const Color(0xFF667085),
//             ),
//           ),
//           Text(
//             subtitle,
//             style: CustomThemeData.generateStyle(
//               fontSize: McGyver.textSize(context, 1.3),
//               fontWeight: FontWeight.bold,
//               color: isDarkMode
//                   ? const Color(0xFFD0D5DD)
//                   : const Color(0xFF667085),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget twoTextPercent(BuildContext context, [bool increment = true]) {
//     var isDarkMode = CustomThemeData.isDarkMode(context);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               "20%",
//               style: CustomThemeData.generateStyle(
//                   fontSize: McGyver.textSize(context, 1.8),
//                   fontWeight: FontWeight.w500,
//                   color: increment
//                       ? isDarkMode
//                           ? const Color(0xFF69E77C)
//                           : const Color(0xFF039855)
//                       : isDarkMode
//                           ? const Color(0xFFF97066)
//                           : const Color(0xFFF04438)),
//             ),
//             Text(
//               "last 24 hrs",
//               style: CustomThemeData.generateStyle(
//                 fontSize: McGyver.textSize(context, 1.3),
//                 fontWeight: FontWeight.w500,
//                 color: isDarkMode
//                     ? const Color(0xFFD0D5DD)
//                     : const Color(0xFF667085),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   void showPositionModal(BuildContext context) {
//     var isDarkMode = CustomThemeData.isDarkMode(context);
//     showModalBottomSheet(
//         backgroundColor:
//             isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
//             topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
//           ),
//         ),
//         context: context,
//         isDismissible: true,
//         enableDrag: true,
//         isScrollControlled: true,
//         builder: (context) {
//           return const PositionModal();
//         });
//   }
// }
