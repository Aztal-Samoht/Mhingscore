import 'dart:math';

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
    if (this.seqOnly) this._creds++;
    this._creds += dblSeq;
    this._creds += dblTrip;
    this._creds += honTrip;
    this._creds += brkRoyRun;
    if (twoSuit) this._creds++;
    if (pair258) this._creds++;
    this._creds += flowers;
    if (tripOnly) this._creds += 3;
    this._creds += (identDblSeq * 3);
    if (royRun) this._creds += 3;
    if (oneSuitHon) this._creds += 3;
    if (noConnect) this._creds += 3;
    if (highLow) this._creds += 5;
    if (allSuitsHon) this._creds += 5;
    if (allDragTrip) this._creds += 8;
    if (oneSuitOnly) this._creds += 8;
    if (noConnectHon) this._creds += 8;
    this._score = this.calcScore(_creds);
    print(this._score);
  }

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
}
