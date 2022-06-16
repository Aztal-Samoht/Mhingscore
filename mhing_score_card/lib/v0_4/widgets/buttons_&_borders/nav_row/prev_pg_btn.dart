import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/widgets/nav_row/nav_btn.dart';
import 'package:mhing_score_card/v0_4/providers/game_provider.dart';
import 'package:provider/provider.dart';

class PrevPageBtn extends StatelessWidget {
  const PrevPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<GameProvider, HandListProvider>(
        builder: (context, gp, hl, child) {
      return Expanded(
        child: NavBtn(
            text: 'Prev',
            onPressed: () {
              gp.singlePlayerMode ? hl.decScreen() : gp.decPage();
            }),
      );
    });
  }
}
