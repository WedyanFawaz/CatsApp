import 'package:cats/Theme/pallete.dart';
import 'package:cats/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class CatInfoPage extends ConsumerWidget {
  final Cats catType;

  CatInfoPage({required this.catType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteCatProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catType.name,
          style: TextStyle(color: Palette.secondary),
        ),
        backgroundColor: Palette.primary,
        actions: [
          IconButton(
            icon: favorites.contains(catType)
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border),
            onPressed: () {
              final favoriteCatState = context.read().favoriteCatProvider;

              if (favorites.contains(catType)) {
                favoriteCatState.state = Set.from(favorites..remove(catType));
              } else {
                favoriteCatState.state = Set.from(favorites..add(catType.name));
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Image.network(
                  catType.imageLink,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                catType.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'origin : ${catType.origin}',
                style: TextStyle(fontSize: 16.0),
              ), SizedBox(height: 10),
              Text(
                'maxWeight : ${catType.maxWeight==0? 'Known': catType.maxWeight} Kg',
                style: TextStyle(fontSize: 16.0),
              ),SizedBox(height: 10),
               Text(
                'minWeight : ${catType.minWeight==0? 'Known': catType.minWeight} Kg',
                style: TextStyle(fontSize: 16.0),
              ),SizedBox(height: 10),
              Text(
                'length : ${catType.length}',
                style: TextStyle(fontSize: 16.0),
              ),SizedBox(height: 10),
              Text(
                'intelligence : ${catType.intelligence==0? 'Unknown': catType.intelligence}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
