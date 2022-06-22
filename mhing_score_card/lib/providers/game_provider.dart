import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mhing_score_card/models/hand.dart';
import 'package:mhing_score_card/models/player.dart';

class GameProvider with ChangeNotifier {
  String _playerName = '';
  bool _isGameActive = false;
  bool shouldPop = false;
  bool _singlePlayerMode = false;
  int _handsPerPage = 3;
  int currentExample = 0;
  Map<String, Player> _players = {};
  Map<String, Player> _newPlayers = {};
  String _activePlayer = '';

  ///getters
  Map<String, Player> get players => _players;
  Map<String, Player> get newPlayers => _newPlayers;
  String get activePlayer => _activePlayer;
  int get handsPerPage => _handsPerPage;
  String get playerName => _playerName;
  bool get isGameActive => _isGameActive;
  bool get singlePlayerMode => _singlePlayerMode;

  ///setters
  set isGameActive(bool value) {
    _isGameActive = value;
  }

  set playerName(String value) {
    _playerName = value;
    notifyListeners();
  }

  set handsPerPage(int value) {
    _handsPerPage = value;
    notifyListeners();
  }

  set activePlayer(String value) {
    _activePlayer = value;
  }

  ///utility functions
  Future<bool> canPop() async {
    if (!shouldPop) {
      Fluttertoast.showToast(
        msg: "Please use in-app back button",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
      );
    }
    return shouldPop;
  }

  void multiPlayerSetupMode() {
    _isGameActive = false;
    _singlePlayerMode = false;
    notifyListeners();
  }

  void startSoloGame() {
    _isGameActive = true;
    _singlePlayerMode = true;
    notifyListeners();
  }

  void resortHands(BuildContext context) {
    _players.forEach((key, value) {
      value.resortHands(context);
    });
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

  void removePlayer(String key) {
    _newPlayers.remove(key);
    notifyListeners();
  }

  void clearNewPlayerList() {
    _newPlayers = {};
  }

  void updatePlayerList() {
    _isGameActive = true;
    _players = _newPlayers;
    _activePlayer = _players.keys.first;
    clearNewPlayerList();
    notifyListeners();
  }

  void ingestHand(BuildContext context, Hand h) {
    _players[_activePlayer]!.addHand(context, h);
    notifyListeners();
  }
  // void printPlayers() {
  //   print('entered printPlayers method');
  //   int i = 0;
  //   _players.forEach((key, value) {
  //     print('$i -- $key: $value');
  //     i++;
  //   });
  // }

  // void printState() {
  //   players.forEach(
  //     (key, value) {
  //       print('$key: ');
  //       value.printState();
  //     },
  //   );
  // }
  int getColumnCount() {
    try {
      return (_players[activePlayer]?.getColumnCount())!;
    } catch (e) {
      return -1;
    }
  }

  List<DataRow> getRows(BuildContext context) {
    try {
      return (players[activePlayer]?.getCurrentPage(context))!;
    } catch (e) {
      return [];
    }
  }

  int getCurrentPage() {
    return (_players[_activePlayer]?.currentPageNumber)!;
  }

  int getNumOfPages() {
    return (_players[_activePlayer]?.getLastPgNum())!;
  }

  void clearForNewMultiGame() {
    playerName = '';
    _singlePlayerMode = false;
    notifyListeners();
  }
}
