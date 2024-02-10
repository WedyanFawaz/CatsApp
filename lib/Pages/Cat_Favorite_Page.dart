import 'package:cats/Pages/Cat_Info_Page.dart';
import 'package:cats/Providers/Favorite_Cats_Provider.dart';
import 'package:cats/Theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteCatsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteCatsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text(
          'Favorite Cats',
          style: TextStyle(color: Palette.secondary,fontFamily: 'ProtestRiot'),
        ),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ))),
            child: Container(
                child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    favorites.elementAt(index).imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(favorites.elementAt(index).name,style: TextStyle(fontFamily: 'ProtestRiot'),),
              ],
            )),
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
