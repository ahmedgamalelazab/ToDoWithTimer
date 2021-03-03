import 'package:ToDoListWithTimer/Model/DataModel.dart';
import 'package:ToDoListWithTimer/Model/NaviModel.dart';
import 'package:ToDoListWithTimer/Utilities/TimerWidget.dart';
import 'package:ToDoListWithTimer/Utilities/UtilitiesLib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_touch_spin/flutter_touch_spin.dart';
import 'package:provider/provider.dart';

import '../Utilities/bottomNavigationBarWidget.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: Text("To Do Form"),
      ),
      body: Consumer2<DataModel, BottomNavigationBarNotifier>(
        builder: (context, xDataModel, xNavModel, child) => ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                20,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(135),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'pleas Insert To Do Job !',
                    style:
                        customizedtextStyle(Colors.white, 15, FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 19, bottom: 10),
                    child: TextField(
                      style: customizedtextStyle(
                          Colors.orange, 15, FontWeight.bold),
                      decoration: InputDecoration(
                        hintStyle: customizedtextStyle(
                            Colors.white54, 12, FontWeight.normal),
                        hintText: "To Do ....",
                      ),
                      //^ code what will happen OnChange!
                      onChanged: (xtext) {
                        xDataModel.setText(text: xtext);
                      },
                    ),
                  ),
                  Text(
                    'pleas pick HH !',
                    style:
                        customizedtextStyle(Colors.white, 15, FontWeight.bold),
                  ),
                  Container(
                    child: TouchSpin(
                      min: 0,
                      max: 24,
                      step: 1,
                      value: 0,
                      textStyle: customizedtextStyle(
                          Colors.white, 12, FontWeight.bold),
                      iconSize: 48.0,
                      addIcon: Icon(Icons.add_circle_outline),
                      subtractIcon: Icon(Icons.remove_circle_outline),
                      iconActiveColor: Colors.green,
                      iconDisabledColor: Colors.grey,
                      iconPadding: EdgeInsets.all(20),
                      onChanged: (val) {
                        xDataModel.setHours(hh: val.toString());
                      },
                    ),
                  ),
                  Text(
                    'pleas pick mm !',
                    style:
                        customizedtextStyle(Colors.white, 15, FontWeight.bold),
                  ),
                  Container(
                    child: TouchSpin(
                      min: 0,
                      max: 60,
                      step: 1,
                      value: 0,
                      textStyle: customizedtextStyle(
                          Colors.white, 12, FontWeight.bold),
                      iconSize: 48.0,
                      addIcon: Icon(Icons.add_circle_outline),
                      subtractIcon: Icon(Icons.remove_circle_outline),
                      iconActiveColor: Colors.green,
                      iconDisabledColor: Colors.grey,
                      iconPadding: EdgeInsets.all(20),
                      onChanged: (val) {
                        xDataModel.setMinutes(mm: val.toString());
                      },
                    ),
                  ),
                  Text(
                    'pleas pick ss !',
                    style:
                        customizedtextStyle(Colors.white, 15, FontWeight.bold),
                  ),
                  Container(
                    child: TouchSpin(
                      min: 0,
                      max: 60,
                      step: 1,
                      value: 0,
                      textStyle: customizedtextStyle(
                          Colors.white, 12, FontWeight.bold),
                      iconSize: 48.0,
                      addIcon: Icon(Icons.add_circle_outline),
                      subtractIcon: Icon(Icons.remove_circle_outline),
                      iconActiveColor: Colors.green,
                      iconDisabledColor: Colors.grey,
                      iconPadding: EdgeInsets.all(20),
                      onChanged: (val) {
                        xDataModel.setSeconds(ss: val.toString());
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              //height: 200,
              //color: Colors.red,
              alignment: Alignment.center,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  xDataModel.timerList.add(TimerOne(
                    tHours: xDataModel.dHours,
                    tMinutes: xDataModel.dMinutes,
                    tSeconds: xDataModel.dSeconds,
                  ));
                  xDataModel.jobToDoList.add(xDataModel.jobToDo);
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
