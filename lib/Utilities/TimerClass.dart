//coding timer class

import 'dart:async';

class TimerClass {
  Stopwatch _sw = new Stopwatch(); //providing me with now details
  String _hours;
  String _minutes;
  String _seconds;
  String _timerToScreen;
  Timer _t; //& will be used to make time tackle
  bool _isRunning = false;
  bool _isPaused = false;
  bool _isReset = false;

  bool get isRunning => _isRunning;
  bool get isPaused => _isPaused;
  bool get isReset => _isReset;

  TimerClass({String hours, String minutes, String seconds}) {
    _hours = hours ?? "0";
    _minutes = minutes ?? "0";
    _seconds = seconds ?? "0";
  }
  //section of getters
  String get hours => _hours;
  String get minutes => _minutes;
  String get seconds => _seconds;
  String get timerToScreen =>
      _timerToScreen ??
      hours.padLeft(2, "0") +
          ":" +
          minutes.padLeft(2, "0") +
          ":" +
          seconds.padLeft(2, "0");
  //^methodes..........................................
  void startTimer() {
    if (!_sw.isRunning) {
      _sw.start();
      _isRunning = true;
      _isPaused = false;
      _isReset = false;
      _updateTimerToScreen();
    }
  }

  void pauseTimer() {
    if (_sw.isRunning) {
      _sw.stop();
      _isRunning = false;
      _isPaused = true;
      _isReset = false;
      _t.cancel();
    }
  }

  void resetTimer() {
    if (_sw.isRunning) {
      _sw.stop();
      _sw.reset();
      _isRunning = false;
      _isPaused = false;
      _isReset = true;
      _resetEveryThing();
      _t.cancel();
    }
  }

  void _resetEveryThing() {
    _timerToScreen = hours.padLeft(2, "0") +
        ":" +
        minutes.padLeft(2, "0") +
        ":" +
        seconds.padLeft(2, "0");
  }

  String _convertFromSecondsToRealTime(int seconds) {
    String str = "";
    if (seconds < 60) {
      str = "00:" + "00:" + seconds.toString().padLeft(2, "0");
    } else if (seconds < 3600) {
      int m = seconds ~/ 60;
      int s = (seconds - (m * 60));
      str = "00:" +
          m.toString().padLeft(2, "0") +
          ":" +
          s.toString().padLeft(2, "0");
    } else {
      // that's mean i need to extrract hourse from here
      int h = (seconds ~/ 3600);
      int remainingFromHours = (seconds - (h * 3600));
      int m = (remainingFromHours ~/ 60);
      int s = (remainingFromHours - (m * 60));
      str = h.toString().padLeft(2, "0") +
          ":" +
          m.toString().padLeft(2, "0") +
          ":" +
          s.toString().padLeft(2, "0");
    }
    return str;
  }

  String _buildTimerToString() {
    String str = "";
    //time in int value
    int xSeconds = int.parse(seconds);
    int xMinutes = int.parse(minutes);
    int xHours = int.parse(hours);

    int totalSeconds = (xHours * 3600) + (xMinutes * 60) + xSeconds;
    //play the timer
    if (_sw.elapsed.inSeconds >= totalSeconds) {
      //reset every thing after finish counting
      pauseTimer();
      resetTimer();
      return hours.padLeft(2, "0") +
          ":" +
          minutes.padLeft(2, "0") +
          ":" +
          seconds.padLeft(2, "0");
    }
    totalSeconds = (totalSeconds -
        _sw.elapsed.inSeconds); // updating seconds once we run the timer

    str = _convertFromSecondsToRealTime(totalSeconds);
    return str;
  }

  void _updateTimerToScreen() async {
    _t = Timer.periodic(Duration(seconds: 1), (t) {
      _timerToScreen = _buildTimerToString();
      print(_timerToScreen);
    });
  }

  void onDispose() {
    if (_t != null) {
      _t.cancel();
    }
  }
}
