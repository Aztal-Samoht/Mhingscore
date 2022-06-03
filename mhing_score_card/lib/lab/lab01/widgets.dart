import 'package:flutter/material.dart';
import 'package:mhing_score_card/lab/lab01/dataProvider.dart';
import 'package:mhing_score_card/lab/lab01/screens.dart';
import 'package:provider/provider.dart';

class NavBtn extends StatelessWidget {
  NavBtn({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        child: Text(text),
        elevation: 50,
        onPressed: onPressed,
      ),
    );
  }
}

class NextPageBtn extends StatelessWidget {
  const NextPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, DP, child) {
      return Expanded(
        child: NavBtn(
          text: 'Next',
          onPressed: () {
            Navigator.pop(context);
            DP.incScreen();
            Navigator.pushNamed(context, DataTableScreenX.id);
          },
        ),
      );
    });
  }
}

class PrevPageBtn extends StatelessWidget {
  const PrevPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, DP, child) {
      return Expanded(
        child: NavBtn(
            text: 'Prev',
            onPressed: () {
              Navigator.pop(context);
              DP.decScreen();
              Navigator.pushNamed(context, DataTableScreenX.id);
            }),
      );
    });
  }
}

class DummyBtn extends StatelessWidget {
  const DummyBtn({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, DP, child) {
      return Expanded(
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: MaterialButton(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey),
            ),
            elevation: 50,
            onPressed: () {},
          ),
        ),
      );
    });
  }
}

class NavRow extends StatelessWidget {
  const NavRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, DP, child) {
        return Row(
          children: [
            DP.currentPage == 0 ? DummyBtn(text: 'Prev') : PrevPageBtn(),
            Expanded(
              child: NavBtn(
                  text: 'back',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            DP.currentPage == DP.dataPages.length - 1
                ? DummyBtn(text: 'Next')
                : NextPageBtn(),
          ],
        );
      },
    );
  }
}
