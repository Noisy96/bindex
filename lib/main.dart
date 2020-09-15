import 'package:flutter/material.dart';
import 'package:bindex_app/screens/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bindex',
        theme: ThemeData(
          primaryColor: Color(0xBA2981).withOpacity(1),
          accentColor: Color(0xBA2981).withOpacity(1),
          fontFamily: 'Roboto'
        ),
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
    );
  }
}