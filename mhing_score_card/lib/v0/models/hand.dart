import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/constants.dart';

class Hand {
  static Icon boolDisplayer(bool b) {
    if (b)
      return Icon(Icons.done, color: Colors.green);
    else
      return Icon(Icons.close, color: Colors.red);
  }

  static Widget toDisplayWidget(dynamic data) {
    if (data.runtimeType == int)
      return Text(
        data.toString(),
        textAlign: TextAlign.center,
        style: kCellStyle,
      );
    else
      return boolDisplayer(data);
  }

  Hand(List<dynamic> newContents) {
    _contents = newContents;
    calcCredits();
    calcScore();
    //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
    int i = 0;
    print('new hand added:');
    print('hand credits: ${_contents[19]}\nHand score ${_contents[20]}');
  }
  List<dynamic> _contents = [];

  List<dynamic> get contents => _contents;

  void calcScore() {
    int bound = 5;
    if (_contents[19] < bound) {
      _contents[20] = pow(2, _contents[19]).toInt();
    } else if (_contents[19] > 40)
      _contents[20] = pow(2, 17).toInt();
    else {
      bound += 2;

      for (int e = 5; e < 17; e++) {
        if (_contents[19] <= bound) {
          _contents[20] = pow(2, e).toInt();
          break;
        } else
          bound += 3;
      }
    }
  }

  void calcCredits() {
    if (_contents[0]) _contents[19]++;
    _contents[19] += _contents[1];
    _contents[19] += _contents[2];
    _contents[19] += _contents[3];
    _contents[19] += _contents[4];
    if (_contents[5]) _contents[19]++;
    if (_contents[6]) _contents[19]++;
    _contents[19] += _contents[7];
    if (_contents[8]) _contents[19] += 3;
    _contents[19] += (_contents[9] * 3);
    if (_contents[10]) _contents[19] += 3;
    if (_contents[11]) _contents[19] += 3;
    if (_contents[12]) _contents[19] += 3;
    if (_contents[13]) _contents[19] += 5;
    if (_contents[14]) _contents[19] += 5;
    if (_contents[15]) _contents[19] += 5;
    if (_contents[16]) _contents[19] += 8;
    if (_contents[17]) _contents[19] += 8;
    if (_contents[18]) _contents[19] += 8;
  }
}
