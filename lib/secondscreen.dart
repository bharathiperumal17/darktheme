import 'package:darktheme/clockview.dart';
import 'package:darktheme/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<bool> horizontalscroll =
      List.generate(cardIcon.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    var themecolor = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        Map cardicondetails = cardIcon[index];
                        var icon = cardicondetails['widget'];
                        var textwidget = cardicondetails['text'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0;
                                  i < horizontalscroll.length;
                                  i++) {
                                if (i == index) {
                                  horizontalscroll[i] = true;
                                } else {
                                  horizontalscroll[i] = false;
                                }
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 20,
                            width: 160,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: horizontalscroll[index]
                                    ? [
                                        themecolor.colorScheme.primary,
                                        themecolor.colorScheme.primary,
                                        themecolor.colorScheme.secondary,
                                      ]
                                    : [
                                        themecolor.colorScheme.background,
                                        themecolor.colorScheme.background,
                                      ],
                                stops: horizontalscroll[index]
                                    ? const [0, 0.5, 1]
                                    : const [0, 1],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    icon,
                                    color: horizontalscroll[index]
                                        ? Colors.black
                                        : themecolor.colorScheme.primary,
                                  ),
                                  Text(
                                    textwidget,
                                    style: TextStyle(
                                      color: horizontalscroll[index]
                                          ? Colors.black
                                          : themecolor.colorScheme.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: cardIcon.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const ClockView(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                height: 150.0,
                child: CustomPaint(
                  painter: RPSCustomPainter(
                      color: themecolor.colorScheme.primary,
                      secondcolor: themecolor.scaffoldBackgroundColor),
                ),
              ),
              Positioned(
                  top: 60,
                  left: MediaQuery.of(context).size.width / 2 - 45,
                  child: Container(
                    height: 160,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(50),
                          top: Radius.circular(50)),
                      color: themecolor.colorScheme.background,
                    ),
                    child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 22.5),
                          child: Text('OFF'),
                        )),
                  )),
              Positioned(
                  top: 65,
                  left: MediaQuery.of(context).size.width / 2 - 37.5,
                  child: Container(
                    height: 100,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(50),
                          top: Radius.circular(50)),
                      color: themecolor.scaffoldBackgroundColor,
                    ),
                    child: Center(
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              // color: themecolor.colorScheme.primary,
                              border: Border.all(
                                  color: themecolor.colorScheme.primary,
                                  width: 2)),
                          child: Center(
                              child: FaIcon(
                            FontAwesomeIcons.powerOff,
                            color: themecolor.colorScheme.primary,
                          ))),
                    ),
                  )),
              Positioned(
                top: 80,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20),
                            top: Radius.circular(20)),
                        color: themecolor.colorScheme.background,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: FaIcon(
                              FontAwesomeIcons.cloud,
                              size: 30,
                              color: themecolor.colorScheme.primary,
                            ),
                          ),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(children: [
                              TextSpan(
                                text: '32',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: themecolor.colorScheme.secondary,
                                  // fontWeight: FontWeight.w500,
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
                                      color: themecolor.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'C\n',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: themecolor.colorScheme.secondary,
                                    // fontWeight: FontWeight.w500,
                                    height: 2),
                              ),
                              TextSpan(
                                text: 'OutSide',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: themecolor.colorScheme.secondary,
                                  // fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      )),
                ),
              ),
              Positioned(
                top: 80,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20),
                            top: Radius.circular(20)),
                        color: themecolor.colorScheme.background,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: FaIcon(
                              FontAwesomeIcons.temperatureHalf,
                              size: 30,
                              color: themecolor.colorScheme.primary,
                            ),
                          ),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(children: [
                              TextSpan(
                                text: '28',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: themecolor.colorScheme.secondary,
                                  // fontWeight: FontWeight.w500,
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
                                      color: themecolor.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'C\n',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: themecolor.colorScheme.secondary,
                                    // fontWeight: FontWeight.w500,
                                    height: 2),
                              ),
                              TextSpan(
                                text: 'Inside',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: themecolor.colorScheme.secondary,
                                  // fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.snowflake,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Cooling',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Dry',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidSun,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Heating',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.camera,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'camera',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.qr_code,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'scan',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.alarm,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Alarm',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.battery_saver,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Battery',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.notes_outlined,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'menu',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.mobile_off_sharp,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Lock',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
           const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.battery_saver,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Battery',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.notes_outlined,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'menu',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.mobile_off_sharp,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Lock',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
           const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.battery_saver,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Battery',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.notes_outlined,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'menu',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.mobile_off_sharp,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Lock',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
           const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.battery_saver,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Battery',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.notes_outlined,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'menu',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20), top: Radius.circular(20)),
                  color: themecolor.colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.mobile_off_sharp,
                      color: themecolor.colorScheme.primary,
                    ),
                    const Text(
                      'Lock',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
