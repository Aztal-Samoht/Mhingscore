import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/hand.dart';
import 'package:mhing_score_card/models/player.dart';

class GameProvider with ChangeNotifier {
  Map<String, Player> _players = {};
  Map<String, Player> _newPlayers = {};
  String _activePlayer = '';

  Map<String, Player> get players => _players;
  Map<String, Player> get newPlayers => _newPlayers;
  String get activePlayer => _activePlayer;

  void addPlayer(Player p) {
    _newPlayers.addAll({p.name: p});
    if (_activePlayer == '') {
      _activePlayer = p.name;
    }
    notifyListeners();
  }

  String clearNewPlayerList() {
    _newPlayers = {};
    notifyListeners();
    return '';
  }

  void updatePlayerList() {
    _players = _newPlayers;
    _activePlayer = clearNewPlayerList();
  }

  void ingestHand(Hand h) {
    _players[_activePlayer]!.addHand(h);
  }

  void printPlayers() {
    print('entered printPlayers method');
    int i = 0;
    _players.forEach((key, value) {
      print('$i -- $key: $value');
      i++;
    });
  }
}
