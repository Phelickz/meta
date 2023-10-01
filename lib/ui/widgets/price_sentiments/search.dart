import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/price_sentiments/price_sentiments_view_model.dart';
import 'package:meta_trader/ui/widgets/home/price_sentiments.dart';

class SearchPriceSentiments extends StatelessWidget {
  const SearchPriceSentiments({super.key, required this.model});
  final PriceSentimentViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // verticalSpaceSmall(context),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            // height: ,
            color: isDarkMode ? const Color(0xff052844) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 5),
              ),
              child: Center(
                child: TextField(
                  style: CustomThemeData.generateStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: model.priceSearchController,
                  onChanged: (String? value) {
                    if ((value ?? '').isNotEmpty) {
                      model.setTyping = true;
                    } else {
                      model.setTyping = false;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: LocaleKeys.search.tr(),
                    hintStyle: CustomThemeData.generateStyle(
                      fontSize: 15,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: model.isTyping
                        ? UnconstrainedBox(
                            child: GestureDetector(
                              onTap: () {
                                model.priceSearchController.clear();
                                model.setTyping = false;
                              },
                              child: SvgPicture.asset(
                                'assets/images/close-square.svg',
                                height: 25,
                                width: 25,
                                // ignore: deprecated_member_use
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.search,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
        verticalSpaceSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 5),
          ),
          child: Text(
            LocaleKeys.search.tr(),
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xff98A2B3)
                  : const Color(0xff475467),
            ),
          ).tr(),
        ),
        verticalSpaceSmall(context),
        Expanded(
          flex: 13,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 5),
            ),
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // model.setPriceSentimentPageEnum =
                    //     PriceSentimentPageEnum.details;
                    // model.setSelectedPrice = 'AUDUSD';
                    model.push(PriceSentimentDetails(model: model));
                    // viewModel.setPriceSentimentPageEnum =
                    //     PriceSentimentPageEnum.details;
                    model.setSelectedPrice = 'AUDUSD';
                  },
                  child: PriceSentiments(
                    pair: 'AUDUSD',
                    big: true,
                    iconButton: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (model.stars.contains(index)) {
                          model.removeStar(index);
                        } else {
                          model.addStar(index);
                        }
                      },
                      icon: Icon(
                        Icons.star,
                        size: 27,
                        color: isDarkMode
                            ? model.stars.contains(index)
                                ? Colors.amber[300]
                                : Colors.black45
                            : model.stars.contains(index)
                                ? Colors.amber
                                : Colors.black45,
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
        ),
      ],
    );
  }
}
