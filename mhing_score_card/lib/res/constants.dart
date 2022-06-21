import 'package:flutter/material.dart';

///gen:
const double kAppBorderRadius = 50;
const double kAppBorderRadiusSm = 30;
const double kBtnRadius = 20;
const double kButtonPadding = 25;
const Color kAppBarColor = Color(0xffff9100);
const Color kBackgroundColor = Colors.black;

///HomeScreen:

///Rules:
const TextStyle kRulesTitle = TextStyle(fontSize: 30);
const TextStyle kRulesSubtitle = TextStyle(fontSize: 20);
const TextStyle kRulesText = TextStyle(fontSize: 15);

///Options:

///modals:
const TextStyle kGameModeModalButtonFont =
    TextStyle(fontSize: 25, color: kButtonTextColor);
const TextStyle kNewGameModalTitleFont =
    TextStyle(color: Color(0xffffa000), fontSize: 20);
const TextStyle kNewGameModalActionFont =
    TextStyle(color: Color(0xffffa000), fontSize: 15.609);
const TextStyle kNewGameModalTableFont =
    TextStyle(color: Color(0xffffa000), fontSize: 18);
const InputDecoration newPlayerFieldDeco = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
);

///Scorecards:
const Icon kNoScore = Icon(
  Icons.remove,
  color: Colors.red,
);
const TextStyle kSubtitleFont =
    TextStyle(color: Color(0xffffa000), fontSize: 15);

const Color kTitleColor = Color(0xffffa000);
const Color kButtonTextColor = Color(0xfffbc02d);
const TextStyle kCellStyle = TextStyle(fontSize: 20);
const TextStyle kNewHandFormFont = TextStyle(fontSize: 15);
const TextStyle kNewHandFormSectonFont = TextStyle(fontSize: 25);
const List<dynamic> kEmptyHand = [
  false,
  0,
  0,
  0,
  0,
  false,
  0,
  0,
  false,
  0,
  0,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  0,
  0,
];
