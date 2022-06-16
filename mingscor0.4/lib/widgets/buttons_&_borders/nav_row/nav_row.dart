import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/dummy_btn.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/nav_btn.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/next_pg_btn.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/prev_pg_btn.dart';
import 'package:provider/provider.dart';

class NavRow extends StatelessWidget {
  const NavRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer2<GameProvider, HandListProvider>(
      builder: (context, gp, hl, child) {
        int modeIndependantCurrentPage =
            gp.singlePlayerMode ? hl.currentPage : gp.getCurrentPage();
        int modeIndependantLastPage =
            gp.singlePlayerMode ? hl.pagedHands.length : gp.getNumOfPages();
        return Row(
          children: [
            modeIndependantCurrentPage == 0
                ? const DummyBtn(text: 'Prev')
                : const PrevPageBtn(),
            Expanded(
              child: NavBtn(
                  text: 'back',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            modeIndependantCurrentPage >= modeIndependantLastPage - 1
                ? const DummyBtn(text: 'Next')
                : const NextPageBtn(),
          ],
        );
      },
    );
  }
}
