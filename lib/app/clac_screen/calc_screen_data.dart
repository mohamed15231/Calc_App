
import 'package:flutter/material.dart';

class CalcScreenData {
  static List<String> button = [
    "AC",
    "+/-",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "×",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "=",
  ];

  static List<String> op = [
    "%",
    "÷",
    "-",
    "×",
    "+",
  ];

  static bool isResult=false;
  static String operation="";
 static double pastNumber=0;
  static void isOP(String data){
    if(op.contains(data)){
      operation=data;
      pastNumber=double.parse(showData);
      showData="0";
    }
  }

  static double result=0.0;

  static String equal(String data){
  switch(data){
    case "%":
      showData = (pastNumber % double.parse(showData)).toString();

    case "+":
      showData = (pastNumber + double.parse(showData)).toString();

    case "×":
      showData = (pastNumber * double.parse(showData)).toString();

    case "÷":
      showData = (pastNumber / double.parse(showData)).toString();


    case "-":
      showData = (pastNumber - double.parse(showData)).toString();

  }
  isResult=true;

  return showData;

  }
  static String showData = "0";

  static List<int> greyColor = [0, 1, 2];
  static List<int> yellowColor = [3, 7, 11, 15, 18];

  static Color colorSelection({required int index}) {
    if (greyColor.contains(index)) {
      return Colors.white60;
    } else if (yellowColor.contains(index)) {
      return Colors.orangeAccent;
    } else {
      return Colors.white10;
    }
  }

  static void calcLogicIfElse({required int index}){
    if (op
        .contains(button[index])) {
      isOP(button[index]);
    } else if (index == 0) {
      isResult=false;
      showData = "0";
      result=0.0;
      operation="";


    } else if (index == 1) {
      if (showData.contains("-")) {
        showData =
            showData.replaceAll("-", "");
      } else {
          showData =
              "-" + showData;

      }
    } else if (index == 18) {
      equal(operation);
    } else {
      if(isResult){
        isResult=false;
        showData =button[index];
      }else{
        showData =
        (showData.length == 1 &&
            showData == "0")
            ? button[index]
            : showData +
            button[index];
      }

    }
  }
}
