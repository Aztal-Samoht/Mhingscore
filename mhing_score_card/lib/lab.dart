//TODO: add ios functionality
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Holder()),
      ],
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: NewHandForm(),
          ),
        ),
      ),
    ),
  );
}

class NewHandForm extends StatefulWidget {
  @override
  State<NewHandForm> createState() => _NewHandFormState();
}

class _NewHandFormState extends State<NewHandForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Column(
          children: [
            Text('test'),
            getNumberPicker([0, 1, 2, 4], 'a test hint', context),
            TextButton(
              onPressed: () {
                print(context.read<Holder>().dblSeq);
              },
              child: Text('print dblSeq'),
            ),
          ],
        ),
      ),
    );
  }

  Row getNumberPicker(List<int> nums, String aHint, BuildContext context) {
    List<DropdownMenuItem<int>> menuItems = [];
    nums.forEach(
      (int a) {
        menuItems.add(DropdownMenuItem(child: Text(a.toString()), value: a));
      },
    );

    return Row(
      children: [
        Expanded(child: Container()),
        Text('$aHint: '),
        Expanded(
          child: DropdownButton<int>(
            value: context.read<Holder>().dblSeq,
            items: menuItems,
            onChanged: (value) {
              setState(() {
                context.read<Holder>().setDblSeq(value!);
              });
            },
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}

class Holder with ChangeNotifier {
  Holder();
  // ///1 cred
  // bool seqOnly;
  int _dblSeq = 0;

  int get dblSeq => _dblSeq;

  void setDblSeq(int value) => _dblSeq = value;

// int dblTrip;
// int honTrip;
// int brkRoyRun;
// bool twoSuit;
// bool pair258;
// int flowers;
//
// ///3 cred
// bool tripOnly;
// int idenDblSeq;
// bool royRun;
// bool oneSuitHon;
// bool noConnect;
//
// ///5 cred
// bool highLow;
// bool allSuitsHon;
//
// ///8 cred
// bool allDragTrip;
// bool oneSuitOnly;
// bool noConnectHon;

}
