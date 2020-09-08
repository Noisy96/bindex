import 'package:flutter/material.dart';
import 'package:bindex_app/screens/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bindex',
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
    );
  }
}