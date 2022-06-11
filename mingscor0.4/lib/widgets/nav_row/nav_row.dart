import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/widgets/nav_row/dummy_btn.dart';
import 'package:mhing_score_card/widgets/nav_row/nav_btn.dart';
import 'package:mhing_score_card/widgets/nav_row/next_pg_btn.dart';
import 'package:mhing_score_card/widgets/nav_row/prev_pg_btn.dart';
import 'package:provider/provider.dart';

class NavRow extends StatelessWidget {
  const NavRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(
      builder: (context, HL, child) {
        return Row(
          children: [
            HL.currentPage == 0 ? DummyBtn(text: 'Prev') : PrevPageBtn(),
            Expanded(
              child: NavBtn(
                  text: 'back',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            HL.currentPage == HL.pagedHands.length - 1
                ? DummyBtn(text: 'Next')
                : NextPageBtn(),
          ],
        );
      },
    );
  }
}
