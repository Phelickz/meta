import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';

class AboutLoyaltyRewards extends StatelessWidget {
  const AboutLoyaltyRewards({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall(context),
            HtmlWidget(
                // the first parameter (`html`) is required
                '''
 <!DOCTYPE html>
<html lang="en">
<body>
    <section>
        <p>Thank you for choosing Meta trader as your trusted forex trading platform.</p>
        <p>We are committed to safeguarding your privacy and protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data. By accessing or using our services, you agree to the practices described in this policy.</p>
    </section>

    <section>
        <h2>1. Information Collection</h2>
         <p>We may collect various types of information from you when you use our platform or services, including:.</p>
        <ul>
            <li>
                <strong>Personal Information:</strong> This may include your name, email address, phone number, residential address, date of birth, government-issued identification, and other necessary details required for account registration and compliance with financial regulations.
            </li>
            <li>
                <strong>Financial Information:</strong> To facilitate transactions, we may collect details related to your bank account, credit/debit card information, and transaction history.
            </li>
            <li>
                <strong>Device and Usage Information:</strong> We may automatically collect information about your device, operating system, browser type, IP address, and interactions with our platform to improve our services and user experience.
            </li>
            <li>
                <strong>Cookies and Tracking Technologies:</strong> We may use cookies and similar technologies to gather information about your usage patterns and preferences while using our platform. This helps us to optimize our website, improve navigation, and personalize your experience.
            </li>
        </ul>
    </section>

    <section>
        <h2>2. Data Sharing And Disclosure</h2>
        <p>We use the collected information for the following purposes:</p>
        <ul>
            <li>
                <strong>Account Creation:</strong> To create and maintain your account, verify your identity, and provide customer support.
            </li>
            <li>
                <strong>Forex Trading Services:</strong> To process your trades, transactions, and withdrawals in accordance with your instructions.
            </li>
        </ul>
    </section>
</body>
</html>

  ''',

                // all other parameters are optional, a few notable params:

                // specify custom styling for an element
                // see supported inline styling below
                customStylesBuilder: (element) {
                  if (element.classes.contains('foo')) {
                    return {'color': 'red'};
                  }

                  return null;
                },

                // render a custom widget
                customWidgetBuilder: (element) {
                  if (element.attributes['foo'] == 'bar') {
                    // return FooBarWidget();
                  }

                  return null;
                },

                // these callbacks are called when a complicated element is loading
                // or failed to render allowing the app to render progress indicator
                // and fallback widget
                onErrorBuilder: (context, element, error) =>
                    Text('$element error: $error'),
                onLoadingBuilder: (context, element, loadingProgress) =>
                    const CircularProgressIndicator(),

                // this callback will be triggered when user taps a link
                onTapUrl: (url) => true,

                // select the render mode for HTML body
                // by default, a simple `Column` is rendered
                // consider using `ListView` or `SliverList` for better performance
                renderMode: RenderMode.column,

                // set the default styling for text
                textStyle: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : const Color(0xff344054))

                // turn on `webView` if you need IFRAME support (it's disabled by default)
                // webView: true,
                ),
            //       Text(
            //         '''Thank you for choosing Meta trader  as your trusted forex trading platform. We are committed to safeguarding your privacy and protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data. By accessing or using our services, you agree to the practices described in this policy.

            // Information Collection
            // We may collect various types of information from you when you use our platform or services, including:

            // Personal Information: This may include your name, email address, phone number, residential address, date of birth, government-issued identification, and other necessary details required for account registration and compliance with financial regulations.
            // Financial Information: To facilitate transactions, we may collect details related to your bank account, credit/debit card information, and transaction history.
            // Device and Usag e Information: We may automatically collect information about your device, operating system, browser type, IP address, and interactions with our platform to improve our services and user experience.
            // Cookies and Tracking Technologies: We may use cookies and similar technologies to gather information about your usage patterns and preferences while using our platform. This helps us to optimize our website, improve navigation, and personalize your experience.

            // Data Sharing And Disclosure
            // We use the collected information for the following purposes:
            // Account Creation: To create and maintain your account, verify your identity, and provide customer support.
            // Forex Trading Services: To process your trades, transactions, and withdrawals in accordance with your instructions.''',
            //         style: CustomThemeData.generateStyle(
            //             fontSize: McGyver.textSize(context, 1.5),
            //             color: isDarkMode ? Colors.white : Colors.black54),
            //       )
          ],
        ),
      ),
    );
  }
}
