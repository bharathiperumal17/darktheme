import 'package:flutter/material.dart';

class ClimateCard extends StatelessWidget {
  const ClimateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themecolor = Theme.of(context);
    return Container(
      height: 150,
      // width: 200,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                themecolor.colorScheme.primary,
                themecolor.colorScheme.primary,
                themecolor.colorScheme.secondary,
              ])),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/image/sunandcloud.png',
                    height: 60,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Cloudy \n',
                        style: TextStyle(
                          fontSize: 26,
                          color: themecolor.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Chennai, TamilNadu',
                        style: TextStyle(
                          color: themecolor.scaffoldBackgroundColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25,bottom: 5),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                        text: '28',
                        style: TextStyle(
                          fontSize: 32,
                          color: themecolor.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Baseline(
                          baseline: 0.0,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            'o',
                            style: TextStyle(
                              color: themecolor.scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '31',
                        style: TextStyle(
                          fontSize: 22,
                          color: themecolor.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Baseline(
                          baseline: 0.0,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            'o',
                            style: TextStyle(
                              color: themecolor.scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '\nSensible',
                        style: TextStyle(
                          color: themecolor.scaffoldBackgroundColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '65% \n',
                        style: TextStyle(
                          fontSize: 22,
                          color: themecolor.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Humidity',
                        style: TextStyle(
                          color: themecolor.scaffoldBackgroundColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '3 \n',
                        style: TextStyle(
                          fontSize: 22,
                          color: themecolor.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'W. force',
                        style: TextStyle(
                          color: themecolor.scaffoldBackgroundColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '1009hpa \n',
                        
                        style: TextStyle(
                          fontSize: 22,
                          color: themecolor.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w500,
                          
                        ),
                      ),
                      TextSpan(
                        text: 'pressure',
                        style: TextStyle(
                          color: themecolor.scaffoldBackgroundColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
