import 'package:provider/provider.dart';

class TempHandProvider with ChangeNotifierProvider {
  TempHandProvider();

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
  int _idenDblSeq = 0;
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

  bool get seqOnly => _seqOnly;
  int get dblSeq => _dblSeq;
  int get dblTrip => _dblTrip;
  int get honTrip => _honTrip;
  int get brkRoyRun => _brkRoyRun;
  bool get twoSuit => _twoSuit;
  bool get pair258 => _pair258;
  int get flowers => _flowers;
  bool get tripOnly => _tripOnly;
  int get idenDblSeq => _idenDblSeq;
  bool get royRun => _royRun;
  bool get oneSuitHon => _oneSuitHon;
  bool get noConnect => _noConnect;
  bool get highLow => _highLow;
  bool get allSuitsHon => _allSuitsHon;
  bool get allDragTrip => _allDragTrip;
  bool get oneSuitOnly => _oneSuitOnly;
  bool get noConnectHon => _noConnectHon;
  set noConnectHon(bool value) => _noConnectHon = value;
  set oneSuitOnly(bool value) => _oneSuitOnly = value;
  set allDragTrip(bool value) => _allDragTrip = value;
  set allSuitsHon(bool value) => _allSuitsHon = value;
  set highLow(bool value) => _highLow = value;
  set noConnect(bool value) => _noConnect = value;
  set oneSuitHon(bool value) => _oneSuitHon = value;
  set royRun(bool value) => _royRun = value;
  set idenDblSeq(int value) => _idenDblSeq = value;
  set tripOnly(bool value) => _tripOnly = value;
  set flowers(int value) => _flowers = value;
  set pair258(bool value) => _pair258 = value;
  set twoSuit(bool value) => _twoSuit = value;
  set brkRoyRun(int value) => _brkRoyRun = value;
  set honTrip(int value) => _honTrip = value;
  set dblTrip(int value) => _dblTrip = value;
  set dblSeq(int value) => _dblSeq = value;
  set seqOnly(bool value) => _seqOnly = value;
}
