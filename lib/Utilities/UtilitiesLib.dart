import 'package:flutter/material.dart';

TextStyle customizedtextStyle(
    Color xcolor, double xFontSize, FontWeight xFontWeight) {
  return TextStyle(
    color: xcolor,
    fontSize: xFontSize,
    fontWeight: xFontWeight,
  );
}

IconThemeData customizedIconThemeData(Color xColor, double xSize) {
  return IconThemeData(
    color: xColor,
    size: xSize,
  );
}

Container cusTomizedText(double xWidth, double xmarginleft, double xMarginTop,
    double xFontSize, String xText, Color xColor, FontWeight xFontWeight) {
  return Container(
    width: xWidth,
    margin: EdgeInsets.only(
      left: xmarginleft,
      top: xMarginTop,
    ),
    child: Text(
      xText,
      style: customizedtextStyle(xColor, xFontSize, xFontWeight),
    ),
  );
}

///text field customization
Container customizedTextField(
    setterCallback(String val),
    double xWidth,
    double xmarginleft,
    double xMarginTop,
    double xMarginRight,
    double xFontSize,
    double xborderSize,
    String xHintText,
    Color xColor,
    Color xCurusorColor,
    FontWeight xFontWeight) {
  return Container(
    width: xWidth,
    margin: EdgeInsets.only(
      left: xmarginleft,
      top: xMarginTop,
      right: xMarginRight,
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: xHintText,
        hintStyle: customizedtextStyle(xColor, xFontSize, xFontWeight),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: xborderSize,
          ),
        ),
        fillColor: Colors.white,
      ),
      cursorColor: Colors.white,
      onChanged: (strVal) {
        setterCallback(strVal);
      },
      style: customizedtextStyle(Colors.white, 17, FontWeight.normal),
      keyboardType: TextInputType.text,
      maxLength: 50,
    ),
  );
}

Container customizedNumberField(
    setterCallback(double val),
    double xWidth,
    double xmarginleft,
    double xMarginTop,
    double xMarginRight,
    double xFontSize,
    double xborderSize,
    String xHintText,
    Color xColor,
    Color xCurusorColor,
    FontWeight xFontWeight) {
  return Container(
    width: xWidth,
    margin: EdgeInsets.only(
      left: xmarginleft,
      top: xMarginTop,
      right: xMarginRight,
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: xHintText,
        hintStyle: customizedtextStyle(xColor, xFontSize, xFontWeight),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: xborderSize,
          ),
        ),
      ),
      cursorColor: Colors.white,
      onChanged: (strVal) {
        setterCallback(double.parse(strVal));
      },
      style: customizedtextStyle(Colors.white, 17, FontWeight.normal),
      maxLength: 6,
      keyboardType: TextInputType.number,
    ),
  );
}

//the source of the data will be the screen that sending the colors

Color xClassifyColorDependingOnCoinsWasted(double xCoin) {
  if (xCoin >= 100 && xCoin < 300) {
    return Colors.cyan;
  } else if (xCoin >= 300 && xCoin < 500) {
    return Colors.purpleAccent;
  } else if (xCoin >= 500 && xCoin < 1000) {
    return Colors.orange;
  } else if (xCoin >= 1000) {
    return Colors.red;
  }
  return Colors.green;
}
