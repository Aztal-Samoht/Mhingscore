import 'package:flutter/material.dart';

class HandSet extends StatelessWidget {
  const HandSet(String? this.card1, String? this.card2, String? this.card3,
      double? this.size,
      {Key? key})
      : super(key: key);

  final String? card1;
  final String? card2;
  final String? card3;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/cards/$card1.png', height: size),
        Image.asset('assets/cards/$card2.png', height: size),
        Image.asset('assets/cards/$card3.png', height: size),
      ],
    );
  }
}
