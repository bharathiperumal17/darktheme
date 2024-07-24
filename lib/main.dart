import 'package:darktheme/homepage.dart';
import 'package:darktheme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) =>ThemeProvider() ,)
    ],
      child: const AppWithTheme());
    
  }
}







class AppWithTheme extends StatelessWidget {
    

  const AppWithTheme({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Theme(
      data: Theme.of(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flattrade',
        themeMode: themeProvider.themeModeValue,
        theme: ThemeDataClass.lightTheme,
        darkTheme: ThemeDataClass.darkTheme,
        home: const UiFirstScreen(),
      ),
    );
  }
}