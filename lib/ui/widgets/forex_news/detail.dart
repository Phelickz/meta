import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';

class DetailNews extends StatelessWidget {
  const DetailNews({super.key, required this.model});
  final ForexNewsViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall(context),
            Text(
              'NZD/USD recovers following mixed NFPs from the US',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.3),
                fontWeight: FontWeight.w800,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Aug 4, 2023 15:07 GMT',
                  style: CustomThemeData.generateStyle(
                    fontSize: 11,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color:
                        isDarkMode ? const Color(0xff344054) : Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Coin Telegraph',
                      style: CustomThemeData.generateStyle(
                        fontSize: 10,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            Container(
              width: double.infinity,
              height: McGyver.rsDoubleH(context, 20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/news.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpaceMedium(context),
            Text(
              '''Thank you for choosing Meta trader  as your trusted forex trading platform. We are committed to safeguarding your privacy and protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data. By accessing or using our services, you agree to the practices described in this policy.

Information Collection
We may collect various types of information from you when you use our platform or services, including:

Personal Information: This may include your name, email address, phone number, residential address, date of birth, government-issued identification, and other necessary details required for account registration and compliance with financial regulations.
Financial Information: To facilitate transactions, we may collect details related to your bank account, credit/debit card information, and transaction history.
Device and Usag e Information: We may automatically collect information about your device, operating system, browser type, IP address, and interactions with our platform to improve our services and user experience.
Cookies and Tracking Technologies: We may use cookies and similar technologies to gather information about your usage patterns and preferences while using our platform. This helps us to optimize our website, improve navigation, and personalize your experience.

Data Sharing And Disclosure
We use the collected information for the following purposes:
Account Creation: To create and maintain your account, verify your identity, and provide customer support.
Forex Trading Services: To process your trades, transactions, and withdrawals in accordance with your instructions. ''',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            verticalSpaceMedium(context)
          ],
        ),
      ),
    );
  }
}
