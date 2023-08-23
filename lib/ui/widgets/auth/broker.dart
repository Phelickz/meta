// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/auth/auth_view_model.dart';

class BrokerPage extends StatelessWidget {
  const BrokerPage({required this.model, super.key});
  final AuthViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceXSmall(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            style: CustomThemeData.generateStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            controller: model.brokerSearchController,
            onChanged: (String? value) {
              if ((value ?? '').isNotEmpty) {
                model.setTyping = true;
              } else {
                model.setTyping = false;
              }
            },
            decoration: InputDecoration(
              hintText: 'Search',
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
                          model.brokerSearchController.clear();
                          model.setTyping = false;
                        },
                        child: SvgPicture.asset(
                          'assets/images/close-square.svg',
                          height: 25,
                          width: 25,
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
        verticalSpaceSmall(context),
        Divider(
          color: Theme.of(context).secondaryHeaderColor,
          thickness: 1,
        ),
        verticalSpaceXSmall(context),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                brokerListTile(context, 'Deriv Limited', 'Deriv', isDarkMode),
                verticalSpaceXSmall(context),
                brokerListTile(
                    context, 'FXTM ECN', 'ForexTime FXTM', isDarkMode),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget brokerListTile(
      BuildContext context, String title, String subtitle, bool isDarkMode) {
    return ListTile(
      onTap: () {
        model.setSelectedBrokerName = title;
        model.setAuthPageEnum = AuthPageEnum.chooseAccount;
      },
      trailing: IconButton(
        icon: Icon(
          Icons.info_outline,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        onPressed: () {},
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/logo.png'),
          ),
          border: Border.all(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        title,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 1.8),
          fontWeight: FontWeight.w700,
          color: isDarkMode ? Colors.white : const Color(0xff667085),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 1.3),
          fontWeight: FontWeight.normal,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
