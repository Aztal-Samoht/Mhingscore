import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/dummy_btn.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/nav_btn.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/next_pg_btn.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/prev_pg_btn.dart';
import 'package:provider/provider.dart';

class NavRow extends StatelessWidget {
  const NavRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gp, child) {
        return Row(
          children: [
            gp.getCurrentPage() == 0 ? const DummyBtn(text: 'Prev') : const PrevPageBtn(),
            Expanded(
              child: NavBtn(
                  text: 'back',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            gp.getCurrentPage() >= gp.getNumOfPages() - 1
                ? const DummyBtn(text: 'Next')
                : const NextPageBtn(),
          ],
        );
      },
    );
  }
}
