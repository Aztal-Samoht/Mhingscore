import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';

class NewHandFormRow<T> extends StatefulWidget {
  const NewHandFormRow(
      {Key? key,
      required this.aHint,
      required this.getter,
      required this.menuItems,
      required this.setter})
      : super(key: key);
  final String aHint;
  final T Function() getter;
  final void Function(T) setter;
  final List<DropdownMenuItem<T>> menuItems;

  @override
  State<NewHandFormRow<T>> createState() => _NewHandFormRowState<T>();
}

class _NewHandFormRowState<T> extends State<NewHandFormRow<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.aHint}: ',
          style: kNewHandFormFont,
        ),
        Expanded(
          child: DropdownButton<T>(
            value: widget.getter(),
            items: widget.menuItems,
            onChanged: (value) {
              setState(() {
                widget.setter(value!);
              });
            },
          ),
        ),
      ],
    );
  }
}
