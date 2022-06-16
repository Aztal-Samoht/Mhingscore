import 'package:flutter/material.dart';

class HandPair extends StatelessWidget {
  const HandPair(this.card1, this.card2, this.size, {Key? key})
      : super(key: key);

  final String? card1;
  final String? card2;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/cards/$card1.png', height: size),
        Image.asset('assets/cards/$card2.png', height: size),
      ],
    );
  }
}
