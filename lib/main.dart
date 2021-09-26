import 'package:borderhacks/locator.dart';
import 'package:borderhacks/views/landing_view.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingView(),
    );
  }
}
