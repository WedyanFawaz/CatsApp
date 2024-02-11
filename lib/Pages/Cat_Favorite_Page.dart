import 'package:cats/pages/cat_info_page.dart';
import 'package:cats/providers/favorite_cats_provider.dart';
import 'package:cats/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteCatsPage extends ConsumerWidget {
  const FavoriteCatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteCatsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: const Text(
          'Favorite Cats',
          style: TextStyle(color: Palette.secondary, fontFamily: 'ProtestRiot'),
        ),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ))),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    favorites.elementAt(index).imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  favorites.elementAt(index).name,
                  style: const TextStyle(fontFamily: 'ProtestRiot'),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CatInfoPage(catType: favorites.elementAt(index)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
