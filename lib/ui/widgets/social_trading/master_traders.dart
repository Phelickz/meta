import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/home/higher_success_rates.dart';

class MasterTraders extends StatelessWidget {
  const MasterTraders({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall(context),
            if (model.viewMoreEnum == null ||
                model.viewMoreEnum == ViewMoreEnum.pt) ...[
              PopularTraders(
                model: model,
              ),
            ],
            verticalSpaceSmall(context),
            // SizedBox(
            //   height: McGyver.rsDoubleH(context, 50),
            //   width: McGyver.rsDoubleW(context, 100),
            //   child: ListView.separated(
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(onTap: () {
            //         model.push(MasterTraderOverview(model: model));
            //       }, child: HigherSuccessRates(
            //         copyOnTap: () {
            //           model.push(MasterTraderOverview(model: model));
            //         },
            //       ));
            //     },
            //     separatorBuilder: (BuildContext context, int index) {
            //       return verticalSpaceXSmall(context);
            //     },
            //   ),
            // ),
            // verticalSpaceSmall(context),
            if (model.viewMoreEnum == ViewMoreEnum.hsr ||
                model.viewMoreEnum == null) ...[
              HigherSuccessRatesCol(
                model: model,
              ),
            ],

            if (model.viewMoreEnum == ViewMoreEnum.lc ||
                model.viewMoreEnum == null) ...[
              LowCommissionCol(
                model: model,
              ),
            ],

            // SizedBox(
            //   height: McGyver.rsDoubleH(context, 50),
            //   width: McGyver.rsDoubleW(context, 100),
            //   child: ListView.separated(
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       return const HigherSuccessRates();
            //     },
            //     separatorBuilder: (BuildContext context, int index) {
            //       return verticalSpaceXSmall(context);
            //     },
            //   ),
            // ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}

class PopularTraders extends StatelessWidget {
  const PopularTraders({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.socialTradingWidget_masterTrader_popularTraders,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xff475467),
              ),
            ).tr(),
            TextButton(
              onPressed: () {
                if (model.viewMoreEnum == ViewMoreEnum.pt) {
                  model.setViewMoreEnum = null;
                } else {
                  model.setViewMoreEnum = ViewMoreEnum.pt;
                }
              },
              child: Text(
                model.viewMoreEnum == ViewMoreEnum.pt
                    ? LocaleKeys.hideMore
                    : LocaleKeys.viewMore,
              ),
            )
          ],
        ),
        verticalSpaceXSmall(context),
        Column(
          children: [
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            verticalSpaceSmall(context),
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            verticalSpaceSmall(context),
            GestureDetector(
              onTap: () {
                model.push(MasterTraderOverview(model: model));
              },
              child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              ),
            ),
            if (model.viewMoreEnum == ViewMoreEnum.pt) ...[
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(
                onTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
                child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                ),
              ),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(
                onTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
                child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}

class HigherSuccessRatesCol extends StatelessWidget {
  const HigherSuccessRatesCol({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys
                  .socialTradingWidget_masterTrader_higherSuccessRatesText,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xff475467),
              ),
            ).tr(),
            TextButton(
              onPressed: () {
                if (model.viewMoreEnum == ViewMoreEnum.hsr) {
                  model.setViewMoreEnum = null;
                } else {
                  model.setViewMoreEnum = ViewMoreEnum.hsr;
                }
              },
              child: Text(
                model.viewMoreEnum == ViewMoreEnum.hsr
                    ? LocaleKeys.hideMore
                    : LocaleKeys.viewMore,
              ),
            )
          ],
        ),
        verticalSpaceXSmall(context),
        // verticalSpaceSmall(context),
        // SizedBox(
        //   height: McGyver.rsDoubleH(context, 50),
        //   width: McGyver.rsDoubleW(context, 100),
        //   child: ListView.separated(
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemCount: 3,
        //     itemBuilder: (context, index) {
        //       return const HigherSuccessRates();
        //     },
        //     separatorBuilder: (BuildContext context, int index) {
        //       return verticalSpaceXSmall(context);
        //     },
        //   ),
        // ),
        Column(
          children: [
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            verticalSpaceSmall(context),
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            verticalSpaceSmall(context),
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            if (model.viewMoreEnum == ViewMoreEnum.hsr) ...[
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(
                onTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
                child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                ),
              ),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(
                onTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
                child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}

class LowCommissionCol extends StatelessWidget {
  const LowCommissionCol({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceXSmall(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.lowCommission,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xff475467),
              ),
            ).tr(),
            TextButton(
              onPressed: () {
                if (model.viewMoreEnum == ViewMoreEnum.lc) {
                  model.setViewMoreEnum = null;
                } else {
                  model.setViewMoreEnum = ViewMoreEnum.lc;
                }
              },
              child: Text(
                model.viewMoreEnum == ViewMoreEnum.lc
                    ? LocaleKeys.hideMore.tr()
                    : LocaleKeys.viewMore.tr(),
              ),
            )
          ],
        ),
        verticalSpaceXSmall(context),
        Column(
          children: [
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            verticalSpaceSmall(context),
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            verticalSpaceSmall(context),
            GestureDetector(onTap: () {
              model.push(MasterTraderOverview(model: model));
            }, child: HigherSuccessRates(
              copyOnTap: () {
                model.push(MasterTraderOverview(model: model));
              },
            )),
            if (model.viewMoreEnum == ViewMoreEnum.lc) ...[
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(
                onTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
                child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                ),
              ),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(onTap: () {
                model.push(MasterTraderOverview(model: model));
              }, child: HigherSuccessRates(
                copyOnTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
              )),
              verticalSpaceSmall(context),
              GestureDetector(
                onTap: () {
                  model.push(MasterTraderOverview(model: model));
                },
                child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
