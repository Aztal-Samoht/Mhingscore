import 'package:flutter/material.dart';

class GameModeAlert extends StatelessWidget {
  const GameModeAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick Game Mode'),
    );
  }
}
