// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';

class DeviceModel {
  final String name;
  final String ip;
  final String location;
  final String date;
  DeviceModel({
    required this.name,
    required this.ip,
    required this.location,
    required this.date,
  });
}

class DeviceTile extends StatelessWidget {
  final DeviceModel device;
  final SecurityViewModel viewModel;
  const DeviceTile({
    super.key,
    required this.viewModel,
    required this.device,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 1.5),
        left: McGyver.rsDoubleW(context, 6),
        right: McGyver.rsDoubleW(context, 6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: McGyver.rsDoubleW(context, 10),
            width: McGyver.rsDoubleW(context, 10),
            margin: EdgeInsets.only(
              top: McGyver.rsDoubleH(context, 1),
            ),
            padding: EdgeInsets.all(
              McGyver.rsDoubleW(context, 1.9),
            ),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xFF052844)
                  : const Color(0xFFD3ECFD),
              borderRadius: BorderRadius.circular(
                McGyver.rsDoubleW(context, 5),
              ),
            ),
            child: SvgPicture.asset(
              "assets/images/mobile.svg",
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xff94D1F9) : const Color(0xFF20A0F3),
                BlendMode.srcIn,
              ),
            ),
          ),
          horizontalSpaceSmall(context),
          SizedBox(
            width: McGyver.rsDoubleW(context, 58),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.name,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2.1),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 0.3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoLeftText("Date:", context),
                    _infoRightText(device.date, context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoLeftText("Location:", context),
                    _infoRightText(device.location, context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoLeftText("IP:", context),
                    _infoRightText(device.ip, context),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _infoLeftText(String label, BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.left,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 1.4),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF98A2B3),
      ),
    );
  }

  Widget _infoRightText(String label, BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.right,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 1.4),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF98A2B3),
      ),
    );
  }
}
