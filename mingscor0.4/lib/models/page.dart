import 'package:mhing_score_card/models/hand.dart';

class Page {
  List<Hand> _contents = [];
  int add(Hand h) {
    if (_contents.length > 2) {
      return -1;
    } else {
      _contents.add(h);
      return 0;
    }
  }
}
