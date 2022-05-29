import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/models/hand.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:provider/provider.dart';

class TempHandProvider with ChangeNotifier {
  ///1 cred
  bool _seqOnly = false;
  int _dblSeq = 0;
  int _dblTrip = 0;
  int _honTrip = 0;
  int _brkRoyRun = 0;
  bool _twoSuit = false;
  bool _pair258 = false;
  int _flowers = 0;

  ///3 cred
  bool _tripOnly = false;
  int _identDblSeq = 0;
  bool _royRun = false;
  bool _oneSuitHon = false;
  bool _noConnect = false;

  ///5 cred
  bool _highLow = false;
  bool _allSuitsHon = false;

  ///8 cred
  bool _allDragTrip = false;
  bool _oneSuitOnly = false;
  bool _noConnectHon = false;

  bool getSeqOnly() => _seqOnly;
  int getDblSeq() => _dblSeq;
  int getDblTrip() => _dblTrip;
  int getHonTrip() => _honTrip;
  int getBrkRoyRun() => _brkRoyRun;
  bool getTwoSuit() => _twoSuit;
  bool getPair258() => _pair258;
  int getFlowers() => _flowers;
  bool getTripOnly() => _tripOnly;
  int getIdentDblSeq() => _identDblSeq;
  bool getRoyRun() => _royRun;
  bool getOneSuitHon() => _oneSuitHon;
  bool getNoConnect() => _noConnect;
  bool getHighLow() => _highLow;
  bool getAllSuitsHon() => _allSuitsHon;
  bool getAllDragTrip() => _allDragTrip;
  bool getOneSuitOnly() => _oneSuitOnly;
  bool getNoConnectHon() => _noConnectHon;
  void setNoConnectHon(bool value) => _noConnectHon = value;
  void setOneSuitOnly(bool value) => _oneSuitOnly = value;
  void setAllDragTrip(bool value) => _allDragTrip = value;
  void setAllSuitsHon(bool value) => _allSuitsHon = value;
  void setHighLow(bool value) => _highLow = value;
  void setNoConnect(bool value) => _noConnect = value;
  void setOneSuitHon(bool value) => _oneSuitHon = value;
  void setRoyRun(bool value) => _royRun = value;
  void setIdenDblSeq(int value) => _identDblSeq = value;
  void setTripOnly(bool value) => _tripOnly = value;
  void setFlowers(int value) => _flowers = value;
  void setPair258(bool value) => _pair258 = value;
  void setTwoSuit(bool value) => _twoSuit = value;
  void setBrkRoyRun(int value) => _brkRoyRun = value;
  void setHonTrip(int value) => _honTrip = value;
  void setDblTrip(int value) => _dblTrip = value;
  void setDblSeq(int value) => _dblSeq = value;
  void setSeqOnly(bool value) => _seqOnly = value;

  void submit(BuildContext context) {
    context.read<HandListProvider>().add(
          Hand(
            this._seqOnly,
            this._dblSeq,
            this._dblTrip,
            this._honTrip,
            this._brkRoyRun,
            this._twoSuit,
            this._pair258,
            this._flowers,
            this._tripOnly,
            this._identDblSeq,
            this._royRun,
            this._oneSuitHon,
            this._noConnect,
            this._highLow,
            this._allSuitsHon,
            this._allDragTrip,
            this._oneSuitOnly,
            this._noConnectHon,
          ),
        );
  }
}
