import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:provider/provider.dart';

class DummyBtn extends StatelessWidget {
  const DummyBtn({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, HL, child) {
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
