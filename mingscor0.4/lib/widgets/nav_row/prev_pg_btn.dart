import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/widgets/nav_row/nav_btn.dart';
import 'package:provider/provider.dart';

class PrevPageBtn extends StatelessWidget {
  const PrevPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return Expanded(
        child: NavBtn(
            text: 'Prev',
            onPressed: () {
              // Navigator.pop(context);
              gp.decPage();
              // Navigator.pushNamed(context, TabedScorecardScreen.id);
            }),
      );
    });
  }
}
