import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/hand.dart';
import 'package:mhing_score_card/models/player.dart';

class GameProvider with ChangeNotifier {
  int handsPerPage = 3;
  int currentExample = 0;
  Map<String, Player> _players = {};
  Map<String, Player> _newPlayers = {};
  String _activePlayer = '';
  Map<String, Player> get players => _players;
  Map<String, Player> get newPlayers => _newPlayers;
  String get activePlayer => _activePlayer;

  set activePlayer(String value) {
    _activePlayer = value;
  }

  void incPage() {
    _players[_activePlayer]?.incPage();
    notifyListeners();
  }

  void decPage() {
    _players[_activePlayer]?.decPage();
    notifyListeners();
  }

  void addPlayer(Player p) {
    _newPlayers.addAll({p.name: p});
    if (_activePlayer == '') {
      _activePlayer = p.name;
    }
    notifyListeners();
  }

  void clearNewPlayerList() {
    _newPlayers = {};
  }

  void updatePlayerList() {
    _players = _newPlayers;
    _activePlayer = _players.keys.first;
    clearNewPlayerList();
    notifyListeners();
  }

  void ingestHand(BuildContext context, Hand h) {
    print('game_provider.ingestHand()');
    _players[_activePlayer]!.addHand(context, h);
    printState();
    notifyListeners();
  }

  void printPlayers() {
    print('entered printPlayers method');
    int i = 0;
    _players.forEach((key, value) {
      print('$i -- $key: $value');
      i++;
    });
  }

  void printState() {
    players.forEach(
      (key, value) {
        print('$key: ');
        value.printState();
      },
    );
  }

  int getColumnCount() {
    try {
      return (_players[activePlayer]?.getColumnCount())!;
    } catch (e) {
      print('exception caught in GameProvider');
      print(e);
      // print(
      //     'players[activePlayer]?.getColumnCount())!: ${players[activePlayer]?.getColumnCount()}');
      // print('players[activePlayer]?: ${players[activePlayer]}');
      return -1;
    }
  }

  List<DataRow> getRows(BuildContext context) {
    try {
      return (players[activePlayer]?.getCurrentPage(context))!;
    } catch (e) {
      print('exception caught in GameProvider');
      print(e);
      print(
          'players[activePlayer]?.getCurrentPage())!: ${players[activePlayer]?.getCurrentPage(context)}');
      print('players[activePlayer]?: ${players[activePlayer]}');
      return [];
    }
  }

  int getCurrentPage() {
    return (_players[_activePlayer]?.currentPageNumber)!;
  }

  int getNumOfPages() {
    return (_players[_activePlayer]?.getLastPgNum())!;
  }
}
