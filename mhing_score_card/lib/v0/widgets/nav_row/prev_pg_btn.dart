import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/widgets/nav_row/nav_btn.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/screens/scorecard_screen.dart';
import 'package:provider/provider.dart';

class PrevPageBtn extends StatelessWidget {
  const PrevPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, HL, child) {
      return Expanded(
        child: NavBtn(
            text: 'Prev',
            onPressed: () {
              Navigator.pop(context);
              HL.decScreen();
              Navigator.pushNamed(context, ScorecardScreen.id);
            }),
      );
    });
  }
}
