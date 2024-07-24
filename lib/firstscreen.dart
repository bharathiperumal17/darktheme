import 'package:darktheme/climatecard.dart';
import 'package:darktheme/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<bool> onclickcolor = List.generate(names.length, (index) => false);
  List<bool> onclickcardSwitch =
      List.generate(cardIcon.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    var themecolor = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const ClimateCard(),
          SizedBox(
            height: 50,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < onclickcolor.length; i++) {
                              if (i == index) {
                                onclickcolor[i] = true;
                              } else {
                                onclickcolor[i] = false;
                              }
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 20,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: onclickcolor[index]
                                  ? [
                                      themecolor.colorScheme.primary,
                                      themecolor.colorScheme.primary,
                                      themecolor.colorScheme.secondary,
                                    ]
                                  : [
                                      themecolor.colorScheme.background,
                                      themecolor.colorScheme.background,
                                    ],
                              stops: onclickcolor[index]
                                  ? const [0, 0.5, 1]
                                  : const [0, 1],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(names[index]),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: names.length,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 500,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: cardIcon.length,
                itemBuilder: (context, index) {
                  Map cardicondetails = cardIcon[index];
                  var icon = cardicondetails['widget'];
                  var textwidget = cardicondetails['text'];
                  var subtext = cardicondetails['subtext'];

                  return SizedBox(
                    height: 200,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: onclickcardSwitch[index]
                                  ? [
                                      themecolor.colorScheme.primary,
                                      themecolor.colorScheme.primary,
                                      themecolor.colorScheme.secondary,
                                    ]
                                  : [
                                      themecolor.colorScheme.background,
                                      themecolor.colorScheme.background,
                                      themecolor.colorScheme.background,
                                    ],
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FaIcon(icon,
                                    size: 20,
                                    color: onclickcardSwitch[index]
                                        ? themecolor.scaffoldBackgroundColor
                                        : themecolor.colorScheme.primary),
                                FaIcon(FontAwesomeIcons.wifi,
                                    size: 20,
                                    color: onclickcardSwitch[index]
                                        ? themecolor.scaffoldBackgroundColor
                                        : themecolor.colorScheme.tertiary),
                              ],
                            ),
                            Text.rich(

                              TextSpan(children: [
                              TextSpan(
                                  text: '$textwidget\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                      color: onclickcardSwitch[index]
                                          ? themecolor.colorScheme.background
                                          : themecolor.colorScheme.secondary,
                                          height: 1.5,)),
                              TextSpan(
                                  text: subtext,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: onclickcardSwitch[index]
                                          ? themecolor.colorScheme.background
                                          : themecolor.colorScheme.tertiary,))
                            ])),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  onclickcardSwitch[index] ? 'ON' : "OFF",
                                  style: TextStyle(
                                      fontWeight: onclickcardSwitch[index]
                                          ? FontWeight.bold
                                          : null,
                                      color: onclickcardSwitch[index]
                                          ? themecolor.scaffoldBackgroundColor
                                          : themecolor.colorScheme.tertiary),
                                ),
                                Switch(
                                  trackColor: MaterialStatePropertyAll(
                                      onclickcardSwitch[index]
                                          ? themecolor.scaffoldBackgroundColor
                                          : themecolor.colorScheme.tertiary),
                                  activeColor: themecolor.colorScheme.primary,
                                  value: onclickcardSwitch[index],
                                  onChanged: (value) {
                                    setState(() {
                                      onclickcardSwitch[index] =
                                          !onclickcardSwitch[index];
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
            SizedBox(
            height: 50,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < onclickcolor.length; i++) {
                              if (i == index) {
                                onclickcolor[i] = true;
                              } else {
                                onclickcolor[i] = false;
                              }
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 20,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: onclickcolor[index]
                                  ? [
                                      themecolor.colorScheme.primary,
                                      themecolor.colorScheme.primary,
                                      themecolor.colorScheme.secondary,
                                    ]
                                  : [
                                      themecolor.colorScheme.background,
                                      themecolor.colorScheme.background,
                                    ],
                              stops: onclickcolor[index]
                                  ? const [0, 0.5, 1]
                                  : const [0, 1],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(names[index]),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: names.length,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}



