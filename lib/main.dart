import 'package:flutter/material.dart';
// import 'package:bindex_app/screens/sign_in.dart';
import 'package:bindex_app/screens/home/mainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bindex',
        theme: ThemeData(
          accentColor: Color(0xBA2981).withOpacity(1),
          fontFamily: 'Roboto'
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
    );
  }
}