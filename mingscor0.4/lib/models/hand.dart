import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';

class Hand {
  static Icon boolDisplayer(bool b) {
    if (b)
      return Icon(Icons.done, color: Colors.green);
    else
      return kNoScore;
  }

  static Widget toDisplayWidget(dynamic data) {
    if (data.runtimeType == int) if (data == 0) {
      return kNoScore;
    } else
      return Text(
        data.toString(),
        textAlign: TextAlign.center,
        style: kCellStyle,
      );
    else
      return boolDisplayer(data);
  }

  Hand(List<dynamic> newContents) {
    _contents = Map.fromIterables(sCatagory, newContents);
    calcCredits();
    calcScore();
  }

  @override
  String toString() {
    return 'Hand{_contents: $_contents}';
  }

  Map<String, dynamic> _contents = {};
  Map<String, dynamic> get contents => _contents;

  void calcCredits() {
    if (_contents[sCatagory[0]]) _contents[sCatagory[19]]++;
    _contents[sCatagory[19]] += _contents[sCatagory[1]];
    _contents[sCatagory[19]] += _contents[sCatagory[2]];
    _contents[sCatagory[19]] += _contents[sCatagory[3]];
    _contents[sCatagory[19]] += _contents[sCatagory[4]];
    if (_contents[sCatagory[5]]) _contents[sCatagory[19]]++;
    _contents[sCatagory[19]] += _contents[sCatagory[6]];
    _contents[sCatagory[19]] += _contents[sCatagory[7]];
    if (_contents[sCatagory[8]]) _contents[sCatagory[19]] += 3;
    _contents[sCatagory[19]] += (_contents[sCatagory[9]] * 3);
    if (_contents[sCatagory[10]]) _contents[sCatagory[19]] += 3;
    if (_contents[sCatagory[11]]) _contents[sCatagory[19]] += 3;
    if (_contents[sCatagory[12]]) _contents[sCatagory[19]] += 3;
    if (_contents[sCatagory[13]]) _contents[sCatagory[19]] += 5;
    if (_contents[sCatagory[14]]) _contents[sCatagory[19]] += 5;
    if (_contents[sCatagory[15]]) _contents[sCatagory[19]] += 5;
    if (_contents[sCatagory[16]]) _contents[sCatagory[19]] += 8;
    if (_contents[sCatagory[17]]) _contents[sCatagory[19]] += 8;
    if (_contents[sCatagory[18]]) _contents[sCatagory[19]] += 8;
  }

  void calcScore() {
    int bound = 5;
    if (_contents[sCatagory[19]] < bound) {
      _contents[sCatagory[20]] = pow(2, _contents[sCatagory[19]]).toInt();
    } else if (_contents[sCatagory[19]] > 40)
      _contents[sCatagory[20]] = pow(2, 17).toInt();
    else {
      bound += 2;

      for (int e = 5; e < 17; e++) {
        if (_contents[sCatagory[19]] <= bound) {
          _contents[sCatagory[20]] = pow(2, e).toInt();
          break;
        } else
          bound += 3;
      }
    }
  }
}
