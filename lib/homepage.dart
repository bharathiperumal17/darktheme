import 'package:darktheme/firstscreen.dart';
import 'package:darktheme/gradienttext.dart';
import 'package:darktheme/scroll_to_hide_widget.dart';
import 'package:darktheme/secondscreen.dart';
import 'package:darktheme/themeprovider.dart';
import 'package:darktheme/thirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UiFirstScreen extends StatefulWidget {
  const UiFirstScreen({super.key});

  @override
  State<UiFirstScreen> createState() => _UiFirstScreenState();
}

class _UiFirstScreenState extends State<UiFirstScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themecolor = Theme.of(context);
    bool switchValue =
        Provider.of<ThemeProvider>(context).themeModeValue == ThemeMode.light;
    final themeProvider = Provider.of<ThemeProvider>(context,listen: false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: _selectedIndex == 0
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                           Text('Hey, ',style: TextStyle(color: themecolor.colorScheme.secondary,fontSize: 22),),
                          GradientText(
                            text: 'Ektiar!!',
                            gradient: LinearGradient(colors: [
                              themecolor.colorScheme.primary,
                              themecolor.colorScheme.primary,
                              themecolor.colorScheme.secondary
                            ]),
                          )
                        ],
                      ),
                      const Text(
                        'Saturday, Dec 09,2023',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  actions: [
                    Switch(
                      value: switchValue,
                      onChanged: (value) {
                        themeProvider
                            .switchThemeData(value);
                      },
                    ),
                     Padding(
                      padding:const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.window_rounded,
                        color: themecolor.colorScheme.primary,
                      ),
                    )
                  ],
                )
              : AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: _selectedIndex == 1
                      ?  Text('Living Room',style: TextStyle(color: themecolor.colorScheme.primary),)
                      :  Text('Statistics',style: TextStyle(color: themecolor.colorScheme.primary),),
                  centerTitle: true,
                  leading: IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              controller: _controller,
              children: [_screens[_selectedIndex]],
            ),
          ),
          bottomNavigationBar: ScrollToHideWidget(
            controller: _controller,
            duration: const Duration(milliseconds: 400),
            child: SingleChildScrollView(
              child: BottomNavigationBar(
                unselectedItemColor: themecolor.colorScheme.secondary,
                selectedItemColor: themecolor.colorScheme.primary,
                type: BottomNavigationBarType.shifting,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: FaIcon(FontAwesomeIcons.house),
                  ),
                  BottomNavigationBarItem(
                    label: 'piechart',
                    icon: FaIcon(FontAwesomeIcons.chartPie),
                  ),
                  BottomNavigationBarItem(
                    label: 'settings',
                    icon: FaIcon(FontAwesomeIcons.gear),
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
