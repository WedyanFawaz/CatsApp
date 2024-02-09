import 'package:cats/Pages/Favorite_Cats_Page.dart';
import 'package:cats/Theme/pallete.dart';
import 'package:cats/model/cat_model.dart';
import 'package:flutter/material.dart';
import '../Widgets/Cat_card.dart';

class CatTypesPage extends StatelessWidget {
  final List<Cats> allCats;

  const CatTypesPage({super.key, required this.allCats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Types of cats',
          style: TextStyle(color: Palette.secondary),
        ),
        backgroundColor: Palette.primary,
        actions: [
          IconButton(
            color: Palette.secondary,
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteCatsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: allCats.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return CatCard(catType: allCats[index]);
        },
      ),
    );
  }
}
