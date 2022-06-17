import 'package:flutter/material.dart';
import 'package:mhing_score_card/res/constants.dart';

const Expanded sMainTitle = Expanded(
  flex: 1,
  child: Text(
    'Mhingscore',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: kTitleColor,
      fontWeight: FontWeight.bold,
      fontSize: 30, //todo: change this back to 40 for production version
    ),
  ),
);
const Text sOptionsTitle = Text(
  'Scorecard Options',
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
    fontSize: 26,
  ),
);
const Text sResumeButtonText = Text(
  'Resume Game',
  style: TextStyle(
    color: kTitleColor,
    fontSize: 26,
  ),
);
const String sScoreCardTitle = 'Mhing Scorecard!';
const String sGameModeModalSoloButton = 'Score For Yourself';
const String sGameModeModalMultiButton = 'Score for the Table';

const String sScoreHandButtonText = 'Score New Hand';

const String sSubmit = 'Submit Hand';

const List<String> sCatagory = [
  'Sequence Only Hand',
  'Double Sequence',
  'Double Triplet',
  'Honor Triplet',
  'Broken Royal Run',
  'Two Suits Only',
  'Pair of 2s, 5s or 8s',
  'Flowers',
  'Triplets Only Hand',
  'Identical Double Sequence',
  'Royal Run',
  'One Suit w/Honors',
  'Nothing Connects',
  'High/Low',
  'All Suits and Honors',
  'Seven Pairs',
  'All Dragon Triplets',
  'One Suit Only',
  'Nothing Connects w/All Honors',
  'Total Credits',
  'Hand Score'
];

const String sRules0 = "Rules of Mhing";
const String sRules1t = "\nOverview:";
const String sRules1 =
    "   A card game for 2 to 6 players using a deck of 150 cards. The deck consists of an Asian Mahjong set with eight Flowers and six Jokers (optional). The Bamboo, Circle & Character cards are called “Suits”. The Wind & Dragon cards are called “Honors”.";
const String sRules2t = "\nObjective:";
const String sRules2 =
    "  To complete a hand of 14 cards consisting of four sets and a pair. A set can be a sequence of three numerical cards or a triplet of three identical cards. Sequences are called “Chows” and Triplets are called “Pungs”. A pair is called “Eyes”. The winning hand is scored and the first player to reach 500 points wins the game. Setup: A dealer is chosen by lot, the deck is shuffled and each player is dealt 13 cards. The dealer will be the starting playe";
const String sRules3t = "\nGame Play:";
const String sRules3 =
    "  A player draws a card, or claims a discard, then discards a card and play passes to the left (clockwise). ";
const String sRules4 =
    "· If a drawn card, or the last discard, completes your hand (a set, pair or special hand) then say “Mhing” and you win the hand. \n· If the last discard will complete a set (sequence or triplet) in your hand it may be claimed (say “Chow” or “Pung”). You must then lay the completed set down (expose it) and discard one card. ";

const String sRules5 =
    "   Claiming can cause skipping of players which is normal. When more than one player makes the same claim the priority is Mhing then Pung then Chow. For ties the player closest to the left of the discarder has priority. Flowers are counted only as bonus points towards a winning hand and are immediately replaced when drawn (say “Bonus”) and set to one side. Jokers are wild cards and can be used as anything except flowers and cannot be changed after being used in an exposed set.";
const String sRules6t = "\nSpecial hands:";
const String sRules6 =
    "   Two hands do not follow the four sets & a pair winning hand pattern: 1) Nothing Connects is when you have no Triplets, no Sequences and no Pairs and all cards in the same Suit are at least three digits apart, and 2) Seven pairs. You can only claim a discard for these hands if it is to win.";
const String sRules7t = "\nScoring:";
const String sRules7 =
    "   Only the winner of the hand can score credits by using any/all combinations of the Mhing scoring elements (higher scoring elements already contain lower related scoring elements). A hand can score from 0 to 41 credits. Once credits are tallied they are then converted to points and the points are added to the players’ total. Deal then passes to the left and another hand is played.";
const String sRules8t = "\nIf playing for money:";
const String sRules8 =
    "   Everyone pays the winner the winning hand value if they won by drawing. If they won by discard then everyone pays the winning hand value except the discarder pays double. Point conversion is a penny a point (rounded to nearest 10 points) and there is a winning hand value limit of 100 points. Mhing claim ties result in a drawn hand. A three credit minimum hand (not including flowers) is optional.";
const String sRules9 =
    "Source: https://boardgamegeek.com/filepage/68922/mhing-card-game-documentation";
