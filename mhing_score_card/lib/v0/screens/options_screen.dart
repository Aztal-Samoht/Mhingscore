import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/appearance/app_border.dart';
import 'package:mhing_score_card/v0/widgets/appearance/mhing_card.dart';
import 'package:provider/provider.dart';

class OptionsScreen extends StatelessWidget {
  static String id = 'optionsScreen';
  const OptionsScreen({Key? key}) : super(key: key);

  List<DropdownMenuItem<int>> getItems() {
    List<DropdownMenuItem<int>> toReturn = [];
    for (int i = 3; i < 6; i++) {
      toReturn.add(DropdownMenuItem(
        child: Text('$i', style: TextStyle(fontSize: 20)),
        value: i,
      ));
    }
    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBorder(
        borderRadius: 50,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Expanded(
                  child: sOptionsTitle,
                ),
                Expanded(
                  flex: 3,
                  child: MhingCard(
                    child: Row(
                      children: [
                        Text(
                          'Hands per screen: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton<int>(
                          value: 3,
                          items: getItems(),
                          onChanged: (value) {
                            context.read<HandListProvider>().handsPerPage =
                                value!;
                          },
                        ),
                        //                    context.read<HandListProvider>().ingest(Hand(_tempContents));
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
*
*
      * */
