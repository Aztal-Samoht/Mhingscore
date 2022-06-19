import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/app_border.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OptionsScreen extends StatelessWidget {
  OptionsScreen({Key? key}) : super(key: key);
  static String id = 'optionsScreen';
  final Uri _url = Uri.parse('https://mhingscore.web.app');

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

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<GameProvider, HandListProvider>(
        builder: (context, gp, hl, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            title: Text('Options'),
          ),
          body: AppBorder(
            borderRadius: kAppBorderRadius,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sOptionsTitle,
                  MhingCard(
                    child: Row(
                      children: [
                        Text(
                          'Hands per screen: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton<int>(
                          value: gp.handsPerPage,
                          items: getItems(),
                          onChanged: (value) {
                            gp.handsPerPage = value!;
                            hl.handsPerPage = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  MhingButton(
                    'Save Changes',
                    onPressed: () {
                      gp.resortHands(context);
                      Navigator.pop(context);
                    },
                    height: 50,
                    width: 100,
                  ),

                  ///https://pub.dev/packages/url_launcher
                  MhingButton(
                    'Privacy Policy',
                    onPressed: _launchUrl,
                    height: 40,
                    width: 100,
                  ),

                  // Link('https://mhingscore.web.app'),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
/*
*import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() => runApp(
      const MaterialApp(
        home: Material(
          child: Center(
            child: RaisedButton(
              onPressed: _launchUrl,
              child: Text('Show Flutter homepage'),
            ),
          ),
        ),
      ),
    );

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
*
      * */
