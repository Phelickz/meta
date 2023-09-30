// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';

import '../../../../app/utils/theme.dart';

class WithdrawalDetailsCard extends StatelessWidget {
  final TransactionsViewModel model;
  final String title;
  final String amount;
  final String date;
  final String status;
  final String time;
  final String sender;
  final String receiver;
  final String transactionId;
  const WithdrawalDetailsCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.status,
    required this.receiver,
    required this.sender,
    required this.transactionId,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 8.pWidth(context)),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xffFECDCA)
                  : const Color(0xffFEE4E2),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AssetManager.transaction,
                color: const Color(0xff7A271A))),
        SizedBox(
          width: 16.pWidth(context),
        ),
        SizedBox(
          width: 238.pWidth(context),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      context: context,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 4.pHeight(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.date,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      "$date $time",
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.pHeight(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.sender,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      sender,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.pHeight(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.receiver,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      receiver,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.pHeight(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.status,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      status,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 8,
                          context: context,
                          lightTextColor: (status == LocaleKeys.successful.tr())
                              ? const Color(0xff20A0F3)
                              : (status == LocaleKeys.pending.tr())
                                  ? const Color(0xffF79009)
                                  : const Color(0xffF04438),
                          darkTextColor: (status == LocaleKeys.successful.tr())
                              ? const Color(0xff77C5F8)
                              : (status == LocaleKeys.pending.tr())
                                  ? const Color(0xffFEC84B)
                                  : const Color(0xffFDA29B)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.pHeight(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.transactionId,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      transactionId,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}

class DepositDetailsCard extends StatelessWidget {
  final TransactionsViewModel model;
  final String title;
  final String amount;
  final String date;
  final String status;
  final String time;
  final String sender;
  final String receiver;
  final String transactionId;
  const DepositDetailsCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.status,
    required this.receiver,
    required this.sender,
    required this.transactionId,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 8.pWidth(context)),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xff073961)
                  : const Color(0xffD3ECFD),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AssetManager.transaction,
                color: isDarkMode
                    ? const Color(0xff20A0F3)
                    : const Color(0xff20A0F3))),
        SizedBox(
          width: 16.pWidth(context),
        ),
        SizedBox(
          width: 238.pWidth(context),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      context: context,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.date,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      "$date $time",
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.sender,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      sender,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.receiver,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      receiver,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.status,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      status,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 8,
                          context: context,
                          lightTextColor: (status == LocaleKeys.successful.tr())
                              ? const Color(0xff20A0F3)
                              : (status == LocaleKeys.pending.tr())
                                  ? const Color(0xffF79009)
                                  : const Color(0xffF04438),
                          darkTextColor: (status == LocaleKeys.successful.tr())
                              ? const Color(0xff77C5F8)
                              : (status == LocaleKeys.pending.tr())
                                  ? const Color(0xffFEC84B)
                                  : const Color(0xffFDA29B)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.transactionId,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      transactionId,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}

class InternalTransferDetailsCard extends StatelessWidget {
  final TransactionsViewModel model;
  final String title;
  final String amount;
  final String date;
  final String status;
  final String time;
  final String sender;
  final String transactionId;
  const InternalTransferDetailsCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.status,
    required this.sender,
    required this.transactionId,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 36,
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 8.pWidth(context)),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xffBDB4FE)
                  : const Color(0xffD9D6FE),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AssetManager.internalTransfer,
                color: const Color(0xff3E1C96))),
        SizedBox(
          width: 16.pWidth(context),
        ),
        SizedBox(
          width: 238.pWidth(context),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      context: context,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.date,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      "$date $time",
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.sender,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      sender,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.status,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      status,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 8,
                          context: context,
                          lightTextColor: (status == LocaleKeys.successful.tr())
                              ? const Color(0xff20A0F3)
                              : (status == LocaleKeys.pending)
                                  ? const Color(0xffF79009)
                                  : const Color(0xffF04438),
                          darkTextColor: (status == LocaleKeys.successful.tr())
                              ? const Color(0xff77C5F8)
                              : (status == LocaleKeys.pending.tr())
                                  ? const Color(0xffFEC84B)
                                  : const Color(0xffFDA29B)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.pWidth(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.transactionId,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xff98A2B3),
                          lightTextColor: const Color(0xff667085)),
                    ).tr(),
                    Text(
                      transactionId,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                          darkTextColor: const Color(0xffD0D5DD),
                          lightTextColor: const Color(0xff98A2B3)),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}
