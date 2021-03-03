import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/NaviModel.dart';
import '../Screens/HomePage.dart';
import '../Screens/ToDoListScreen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarNotifier>(
      builder: (context, xNavModel, child) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.file_upload), label: "ToDoScreen"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "ToDoListScreen"),
        ],
        currentIndex: xNavModel.index,
        onTap: (ind) {
          xNavModel.setNavIndex(ind);
          switch (ind) {
            case 0:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DataScreen()));
              break;
            default:
          }
        },
      ),
    );
  }
}
