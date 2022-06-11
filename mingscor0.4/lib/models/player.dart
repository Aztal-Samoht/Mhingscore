import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/hand.dart';

class Player {
  Player(this._name);

  final String _name;
  List<Hand> _hands = [];
  int _currentPage = 0;
  int _totalScore = 0;

  int get totalScore => _totalScore;
  String get name => _name;
  List<Hand> get hands => _hands;
  int get currentPage => _currentPage;

  set hands(List<Hand> value) {
    _hands = value;
  }

  set currentPage(int value) {
    _currentPage = value;
  }

  void addHand(Hand h) {
    _hands.add(h);
  }

  void removeHand(int index) {
    _hands.removeAt(index);
  }

  @override
  String toString() {
    return 'Player{_name: $_name, _hands: $_hands, _currentPage: $_currentPage}';
  }
}
