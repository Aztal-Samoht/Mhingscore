import 'package:flutter/material.dart';
import 'package:mhing_score_card/lab/lab01/dataProvider.dart';
import 'package:mhing_score_card/lab/lab01/screens.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        // theme: getMytheme(context),
        title: 'Mhingscore Card!',
        initialRoute: LabHomeScreen.id,
        routes: {
          DataTableScreenX.id: (context) => DataTableScreenX(),
          // DataTableScreen0.id: (context) => DataTableScreen0(),
          // DataTableScreenN.id: (context) => DataTableScreenN(),
          // DataTableScreenI.id: (context) => DataTableScreenI(),
          LabHomeScreen.id: (context) => LabHomeScreen(),
        },
      ),
    ),
  );
}
