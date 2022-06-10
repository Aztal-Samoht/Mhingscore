import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/hand.dart';

class Player {
  Player(this._name);

  final String _name;
  List<Hand> _hands = [];
  int _currentPage = 0;

  String get name => _name;
  List<Hand> get hands => _hands;
  int get currentPage => _currentPage;

  set hands(List<Hand> value) {
    _hands = value;
  }

  set currentPage(int value) {
    _currentPage = value;
  }

  int addHand(Hand h) {
    try {
      _hands.add(h);
    } catch (e) {
      return -1;
    }
    return 0;
  }

  int removeHand(int index) {
    try {
      _hands.removeAt(index);
    } catch (e) {
      return -1;
    }
    return 0;
  }

  @override
  String toString() {
    return 'Player{_name: $_name, _hands: $_hands, _currentPage: $_currentPage}';
  }
}
