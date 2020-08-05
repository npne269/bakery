import 'package:flutter/material.dart';
import 'package:mybakery/pages/homePage.dart';

void main() => runApp(SuperBakery());

class SuperBakery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuperBakery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData(
        fontFamily: 'Cormorant'
      ),
      home: HomePage(),
    );
  }
}