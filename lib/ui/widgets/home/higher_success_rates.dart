import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class HigherSuccessRates extends StatelessWidget {
  const HigherSuccessRates({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Card(
      color:
          isDarkMode ? Theme.of(context).scaffoldBackgroundColor : Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isDarkMode ? Colors.white24 : Colors.black12,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/btc.png'),
                  horizontalSpaceXSmall(context),
                  Text(
                    'Profit_goddess',
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.8),
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber[300],
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber[300],
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber[300],
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber[300],
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber[300],
                      )
                    ],
                  )
                ],
              ),
              verticalSpaceXSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Copiers: ',
                      style: CustomThemeData.generateStyle(
                        fontSize: 10,
                        color: isDarkMode ? Colors.white : Colors.black45,
                      ),
                      children: [
                        TextSpan(
                          text: '326,587',
                          style: CustomThemeData.generateStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Risk score: ',
                          style: CustomThemeData.generateStyle(
                            fontSize: 8,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'MEDIUM',
                              style: CustomThemeData.generateStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              verticalSpaceXSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '322 ',
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.5),
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Days',
                                  style: CustomThemeData.generateStyle(
                                    fontSize: 8,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Experience',
                            style: CustomThemeData.generateStyle(
                              fontSize: 8,
                              color: isDarkMode ? Colors.white : Colors.black54,
                            ),
                          )
                        ],
                      ),
                      horizontalSpaceXSmall(context),
                      Container(
                        height: 40,
                        width: 1,
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.white : Colors.black45,
                        ),
                      ),
                      horizontalSpaceXSmall(context),
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '99.32 ',
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.5),
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: '%',
                                  style: CustomThemeData.generateStyle(
                                    fontSize: 8,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Success Rate',
                            style: CustomThemeData.generateStyle(
                              fontSize: 8,
                              color: isDarkMode ? Colors.white : Colors.black54,
                            ),
                          )
                        ],
                      ),
                      horizontalSpaceXSmall(context),
                      Container(
                        height: 40,
                        width: 1,
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.white : Colors.black45,
                        ),
                      ),
                      horizontalSpaceXSmall(context),
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '10 ',
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.5),
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: '%',
                                  style: CustomThemeData.generateStyle(
                                    fontSize: 8,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Commission',
                            style: CustomThemeData.generateStyle(
                              fontSize: 8,
                              color: isDarkMode ? Colors.white : Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Theme.of(context).primaryColor.withOpacity(0.8)
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Text(
                              'Copy',
                              style: CustomThemeData.generateStyle(
                                fontSize: 13,
                                color: isDarkMode ? Colors.white : Colors.white,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/images/copy-success.svg',
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
