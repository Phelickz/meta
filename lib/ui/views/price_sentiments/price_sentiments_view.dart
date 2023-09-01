import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/price_sentiments/price_sentiments_view_model.dart';
import 'package:meta_trader/ui/widgets/home/price_sentiments.dart';
import 'package:meta_trader/ui/widgets/price_sentiments/details.dart';
import 'package:meta_trader/ui/widgets/price_sentiments/search.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';
import '../../../app/responsiveness/res.dart';

@RoutePage()
class PriceSentimentsView extends StackedView<PriceSentimentViewModel> {
  const PriceSentimentsView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    PriceSentimentViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: viewModel.returnAppbar(context),
      body: viewModel.priceSentimentPageEnum == PriceSentimentPageEnum.details
          ? const PriceSentimentDetails()
          : viewModel.priceSentimentPageEnum == PriceSentimentPageEnum.search
              ? SearchPriceSentiments(
                  model: viewModel,
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: McGyver.rsDoubleW(context, 5),
                    vertical: 18,
                  ),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        viewModel.priceTypeEnum == PriceTypeEnum.sentiments
                            ? 15
                            : 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          viewModel.setPriceSentimentPageEnum =
                              PriceSentimentPageEnum.details;
                          viewModel.setSelectedPrice = 'AUDUSD';
                        },
                        child: PriceSentiments(
                          pair: 'AUDUSD',
                          big: true,
                          iconButton: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              size: 27,
                              color:
                                  isDarkMode ? Colors.amber[300] : Colors.amber,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox();
                    },
                  ),
                ),
    );
  }

  @override
  PriceSentimentViewModel viewModelBuilder(BuildContext context) =>
      PriceSentimentViewModel();
}
