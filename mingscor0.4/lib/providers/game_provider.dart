import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/player.dart';

class GameProvider with ChangeNotifier {
  Map<String, Player> _players = {};
  Map<String, Player> _newPlayers = {};

  Map<String, Player> get newPlayers => _newPlayers;

  void addPlayer(Player p) {
    _newPlayers.addAll({p.name: p});
    notifyListeners();
  }

  void clearNewPlayerList() {
    _newPlayers = {};
    notifyListeners();
  }

  void updatePlayerList() {
    _players = _newPlayers;
    clearNewPlayerList();
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
