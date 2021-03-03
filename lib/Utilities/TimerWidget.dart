import 'dart:async';

import 'package:ToDoListWithTimer/Utilities/UtilitiesLib.dart';
import 'package:flutter/material.dart';

import 'TimerClass.dart';

class TimerOne extends StatefulWidget {
  TimerOne({Key key, this.tHours, this.tMinutes, this.tSeconds})
      : super(key: key);
  final String tHours;
  final String tMinutes;
  final String tSeconds;
  @override
  _TimerOneState createState() =>
      _TimerOneState(sHours: tHours, sMinutes: tMinutes, sSeconds: tSeconds);
}

class _TimerOneState extends State<TimerOne> {
  final String sHours;
  final String sMinutes;
  final String sSeconds;
  TimerClass _t;
  String _toScreenTimer;
  Timer _tick;

  @override
  void initState() {
    _t = TimerClass(hours: sHours, minutes: sMinutes, seconds: sSeconds);
    _toScreenTimer = _t.timerToScreen;
    super.initState();
  }

  _TimerOneState({this.sHours, this.sMinutes, this.sSeconds});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Text(_toScreenTimer,
              style: customizedtextStyle(Colors.white, 15, FontWeight.bold)),
        ),
        Container(
            width: 50,
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                if (_t.isRunning == false) {
                  _t.startTimer();
                  _tick = Timer.periodic(Duration(seconds: 1), (_) {
                    setState(() {
                      _toScreenTimer = _t.timerToScreen;
                    });
                  });
                } else {
                  setState(() {
                    _t.pauseTimer();
                    _tick.cancel();
                  });
                }
              },
              child: _t.isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
            )),
        Container(
            width: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 15),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  _t.resetTimer();
                  _toScreenTimer = _t.timerToScreen;
                  _tick.cancel();
                });
              },
              child: Container(
                  alignment: Alignment.center, child: Icon(Icons.replay)),
            ))
      ],
    );
  }

  @override
  void dispose() {
    if (_t != null) {
      _t.onDispose();
    }
    if (_tick != null) {
      _tick.cancel();
    }

    super.dispose();
  }
}
