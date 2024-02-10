import 'package:cats/Theme/pallete.dart';
import 'package:cats/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Providers/Favorite_Cats_Provider.dart';

class CatInfoPage extends ConsumerWidget {
  final Cats catType;

  CatInfoPage({super.key, required this.catType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteCatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          catType.name,
          style: TextStyle(color: Palette.secondary,fontFamily: 'ProtestRiot'),
        ),
        backgroundColor: Palette.primary,
        actions: [
          IconButton(
            icon: favorites.contains(catType)
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border),
            onPressed: () {
              ref
                  .read(favoriteCatsProvider.notifier)
                  .togglecatFavoriteStatus(catType);
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
              SizedBox(height: 10),
              Text(
                catType.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,fontFamily: 'ProtestRiot'),
              ),
              SizedBox(height: 5),
              Text(
                'Origin : ${catType.origin}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 5),
              Text(
                'MaxWeight : ${catType.maxWeight == 0 ? 'Known' : catType.maxWeight} Kg',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 5),
              Text(
                'MinWeight : ${catType.minWeight == 0 ? 'Known' : catType.minWeight} Kg',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 5),
              Text(
                'Length : ${catType.length}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 5),
              Text(
                'Intelligence : ${catType.intelligence == 0 ? 'Unknown' : catType.intelligence}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
