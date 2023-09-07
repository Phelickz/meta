import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:meta_trader/ui/widgets/quotes/components/trade_appbar.dart';
import 'package:meta_trader/ui/widgets/quotes/components/trade_depth.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

class TradeDepthScreen extends StackedView<QuotesViewModel>{
  const TradeDepthScreen({super.key});

  @override
  Widget builder(BuildContext context, QuotesViewModel viewModel, Widget? child) {
    // TODO: implement builder
    return Skeleton(
      isBusy: viewModel.isBusy, 
      appBar: tradeAppBars1(context, true, "EURUSD", "Depth of Market",popMenu()), 
      bodyPadding: EdgeInsets.symmetric(vertical: 16.pHeight(context), horizontal: 24.pWidth(context)),
      body: const TradeDepthGrid()
    );
  }


  Widget popMenu(){
    return PopupMenuButton(
      // padding: EdgeInsets.all(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(AssetManager.settings4),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('Lots'),
          onTap: (){},
          enabled: true,
        ),
        PopupMenuItem(
          child: Text('Amount'),
          onTap: (){},
          enabled: false,
          )
      ]
    );
  }
  @override
  QuotesViewModel viewModelBuilder(BuildContext context) {
    return QuotesViewModel();
  }
  
}