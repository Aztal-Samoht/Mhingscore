import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';

const Text sMainTitle = Text(
  'Mhingscore',
  textAlign: TextAlign.center,
  style: TextStyle(
    color: kTitleColor,
    fontWeight: FontWeight.bold,
    fontSize: 45,
  ),
);

const Text sNewGameButtonText = Text(
  'New Game',
  style: TextStyle(
    color: kTitleColor,
    fontSize: 30,
  ),
);
const String sScoreCardTitle = 'Mhing Scorecard!';

const String sScoreHandButtonText = 'score new hand';

const String sNext = 'To next Catagory';

const List<String> sCatagory = [
  'Sequence Only Hand',
  'Double Sequence',
  'Double Triplet',
  'Honor Triplet',
  'Broken Royal Run',
  'Two Suits Only',
  'Pair of 2s, 5s or 8s',
  'Flowers',
  'Triplets Only  sHand',
  'Identical Double Sequence',
  'Royal Run',
  'One Suit w/Honors',
  'Nothing Connects',
  'High/Low',
  'All Suits and Honors',
  'All Dragon Triplets',
  'One Suit Only',
  'Nothing Connects w/All Honors',
  'Total Credits',
  'Hand Score'
];
