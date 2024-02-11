import 'package:cats/Pages/cat_types_page.dart';
import 'package:cats/model/cat_model.dart';
import 'package:cats/web_serivce/cats_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final catWebSerivces = CatWebSerivces();
  List<Cats> catList = await catWebSerivces.getCatList();
  runApp(
    ProviderScope(
      child: MyApp(list: catList),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<Cats> list;

  const MyApp({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Types',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatTypesPage(allCats: list),
    );
  }
}
