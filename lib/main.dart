import 'package:cats/data/all_cats.dart';
import 'package:cats/model/cat.dart';
import 'package:cats/screens/cats_home_screen.dart';
import 'package:flutter/material.dart';

final cats = allCats.map<Cat>((jsonCat) => Cat.fromJson(jsonCat)).toList();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CatsHomeScreen(),
    );
  }
}
