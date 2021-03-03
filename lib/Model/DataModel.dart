import 'package:ToDoListWithTimer/Utilities/TimerWidget.dart';
import 'package:flutter/widgets.dart';

class DataModel extends ChangeNotifier {
  String _dString;
  String _dHours;
  String _dMinutes;
  String _dSeconds;
  List<TimerOne> _timerList = [];
  List<String> _jobToDoList = [];

  String get jobToDo => _dString ?? "";
  String get dHours => _dHours;
  String get dMinutes => _dMinutes;
  String get dSeconds => _dSeconds;
  List<TimerOne> get timerList => _timerList;
  List<String> get jobToDoList => _jobToDoList;

  //setters
  void setText({String text}) {
    _dString = text ?? "No Job TO DO";
  }

  void setHours({String hh}) {
    _dHours = hh;
  }

  void setMinutes({String mm}) {
    _dMinutes = mm;
  }

  void setSeconds({String ss}) {
    _dSeconds = ss;
  }
}
