import 'dart:math';

import 'package:flutter/material.dart';

class Hand {
  Hand(
      this.seqOnly,
      this.dblSeq,
      this.dblTrip,
      this.honTrip,
      this.brkRoyRun,
      this.twoSuit,
      this.pair258,
      this.flowers,
      this.tripOnly,
      this.identDblSeq,
      this.royRun,
      this.oneSuitHon,
      this.noConnect,
      this.highLow,
      this.allSuitsHon,
      this.allDragTrip,
      this.oneSuitOnly,
      this.noConnectHon) {
    fillContents();
    calcCredits();
    _contents[19] = calcScore(_contents[18]);
  }
  List<dynamic> _contents = [];

  List<dynamic> get contents => _contents;

  ///1 cred
  final bool seqOnly;
  final int dblSeq;
  final int dblTrip;
  final int honTrip;
  final int brkRoyRun;
  final bool twoSuit;
  final bool pair258;
  final int flowers;

  ///3 cred
  final bool tripOnly;
  final int identDblSeq;
  final bool royRun;
  final bool oneSuitHon;
  final bool noConnect;

  ///5 cred
  final bool highLow;
  final bool allSuitsHon;

  ///8 cred
  final bool allDragTrip;
  final bool oneSuitOnly;
  final bool noConnectHon;

  ///scores
  int _creds = 0;
  int _score = 0;

  int get score => _score;

  int get creds => _creds;

  int calcScore(int c) {
    int bound = 5;
    if (c < bound) return pow(2, c).toInt();
    bound += 2;
    for (int e = 5; e < 17; e++) {
      if (c <= bound)
        return pow(2, e).toInt();
      else
        bound += 3;
    }
    return pow(2, 17).toInt();
  }

  static Icon boolDisplayer(bool b) {
    if (b)
      return Icon(Icons.done);
    else
      return Icon(Icons.close);
  }

  void fillContents() {
    _contents = [
      seqOnly,
      dblSeq,
      dblTrip,
      honTrip,
      brkRoyRun,
      twoSuit,
      pair258,
      flowers,
      tripOnly,
      identDblSeq,
      royRun,
      oneSuitHon,
      noConnect,
      highLow,
      allSuitsHon,
      allDragTrip,
      oneSuitOnly,
      noConnectHon,
      0,
      0,
    ];
  }

  void calcCredits() {
    if (seqOnly) _contents[18]++;
    _contents[18] += dblSeq;
    _contents[18] += dblTrip;
    _contents[18] += honTrip;
    _contents[18] += brkRoyRun;
    if (twoSuit) _contents[18]++;
    if (pair258) _contents[18]++;
    _contents[18] += flowers;
    if (tripOnly) _contents[18] += 3;
    _contents[18] += (identDblSeq * 3);
    if (royRun) _contents[18] += 3;
    if (oneSuitHon) _contents[18] += 3;
    if (noConnect) _contents[18] += 3;
    if (highLow) _contents[18] += 5;
    if (allSuitsHon) _contents[18] += 5;
    if (allDragTrip) _contents[18] += 8;
    if (oneSuitOnly) _contents[18] += 8;
    if (noConnectHon) _contents[18] += 8;
    _creds = _contents[18];
    _score = calcScore(_contents[18]);
    //TODO:DELETE THIS PRINT STATEMENT
    print('hand credits: $_creds\nHand score $_score');
  }

  static Widget toDisplay(dynamic data) {
    if (data.runtimeType == int)
      return Text(data.toString());
    else
      return boolDisplayer(data);
  }
}
