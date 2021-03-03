import 'package:ToDoListWithTimer/Utilities/UtilitiesLib.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ToDoListWithTimer/Model/DataModel.dart';
import '../Utilities/TimerWidget.dart';
import '../Utilities/bottomNavigationBarWidget.dart';

// ignore: must_be_immutable
class DataScreen extends StatefulWidget {
  DataScreen({Key key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, xDataModel, child) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          centerTitle: true,
          title: Text("ToDoList"),
        ),
        body: ListView.builder(
          itemCount: xDataModel.timerList.length,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(xDataModel.jobToDoList[index],
                        style: customizedtextStyle(
                            Colors.white, 12, FontWeight.bold)),
                    xDataModel.timerList[index],
                    Container(
                      // color: Colors.red,
                      margin: EdgeInsets.only(right: 10),
                      width: 50,
                      child: RaisedButton(
                          color: Colors.red,
                          onPressed: () {
                            setState(
                              () {
                                //remove
                                xDataModel.jobToDoList.removeAt(index);
                                xDataModel.timerList.removeAt(index);
                                //reset every thing to re edit from main screen
                                xDataModel.setHours(hh: "0");
                                xDataModel.setMinutes(mm: "0");
                                xDataModel.setSeconds(ss: "0");
                                xDataModel.setText(text: "");
                              },
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
