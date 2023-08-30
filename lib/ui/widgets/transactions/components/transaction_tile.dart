// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';

import '../../../../app/utils/theme.dart';

class WithdrawalTile extends StatelessWidget {
  final TransactionsViewModel model;
  final String title;
  final String amount;
  final String date;
  final String status;
  final String time;
  final VoidCallback onPressed;
  const WithdrawalTile({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.onPressed,
    required this.status,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onPressed,
      leading: Container(
          width: 36,
          height: 36,
          padding: EdgeInsets.symmetric(horizontal: 8.pWidth(context)),
          decoration: BoxDecoration(
            color: isDarkMode ? Color(0xffFECDCA) : Color(0xffFEE4E2),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(AssetManager.transaction,
              color: Color(0xff7A271A))),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "\$$amount",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            status,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 8,
                context: context,
                lightTextColor: (status == "Successful")
                    ? Color(0xff20A0F3)
                    : (status == "Pending")
                        ? Color(0xffF79009)
                        : Color(0xffF04438),
                darkTextColor: (status == "Successful")
                    ? Color(0xff77C5F8)
                    : (status == "Pending")
                        ? Color(0xffFEC84B)
                        : Color(0xffFDA29B)),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class DepositTile extends StatelessWidget {
  final TransactionsViewModel model;
  final String title;
  final String amount;
  final String date;
  final String status;
  final String time;
  final VoidCallback onPressed;
  const DepositTile({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.onPressed,
    required this.status,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onPressed,
      leading: Container(
          width: 36,
          height: 36,
          padding: EdgeInsets.symmetric(horizontal: 8.pWidth(context)),
          decoration: BoxDecoration(
            color: isDarkMode ? Color(0xff073961) : Color(0xffD3ECFD),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(AssetManager.transaction,
              color: isDarkMode ? Color(0xff20A0F3) : Color(0xff20A0F3))),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "\$$amount",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            status,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 8,
                context: context,
                lightTextColor: (status == "Successful")
                    ? Color(0xff20A0F3)
                    : (status == "Pending")
                        ? Color(0xffF79009)
                        : Color(0xffF04438),
                darkTextColor: (status == "Successful")
                    ? Color(0xff77C5F8)
                    : (status == "Pending")
                        ? Color(0xffFEC84B)
                        : Color(0xffFDA29B)),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class InternalTransferTile extends StatelessWidget {
  final TransactionsViewModel model;
  final String title;
  final String amount;
  final String date;
  final String status;
  final String time;
  final VoidCallback onPressed;
  const InternalTransferTile({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.onPressed,
    required this.status,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onPressed,
      leading: Container(
          width: 36,
          height: 36,
          padding: EdgeInsets.symmetric(horizontal: 8.pWidth(context)),
          decoration: BoxDecoration(
            color: isDarkMode ? Color(0xffBDB4FE) : Color(0xffD9D6FE),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(AssetManager.internalTransfer,
              color: Color(0xff3E1C96))),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "\$$amount",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            status,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 8,
                context: context,
                lightTextColor: (status == "Successful")
                    ? Color(0xff20A0F3)
                    : (status == "Pending")
                        ? Color(0xffF79009)
                        : Color(0xffF04438),
                darkTextColor: (status == "Successful")
                    ? Color(0xff77C5F8)
                    : (status == "Pending")
                        ? Color(0xffFEC84B)
                        : Color(0xffFDA29B)),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
