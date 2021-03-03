import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/DataModel.dart';
import 'Model/NaviModel.dart';
import 'Screens/HomePage.dart';
import 'Utilities/UtilitiesLib.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarNotifier>(
            create: (context) => BottomNavigationBarNotifier()),
        ChangeNotifierProvider<DataModel>(create: (context) => DataModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 16,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white54,
            size: 13,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          backgroundColor: Colors.black,
          selectedLabelStyle:
              customizedtextStyle(Colors.white, 18, FontWeight.bold),
          unselectedLabelStyle:
              customizedtextStyle(Colors.white54, 15, FontWeight.normal),
        ),
      ),
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable

//what will happen if i have a lit of trees
