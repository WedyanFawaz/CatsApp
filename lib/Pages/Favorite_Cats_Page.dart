import 'package:cats/Theme/pallete.dart';
import 'package:cats/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoriteCatsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteCatProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text(
          'Favorite Cats',
          style: TextStyle(color: Palette.secondary),
        ),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites.elementAt(index)),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         CatInfoPage(catType: favorites.elementAt(index)),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
