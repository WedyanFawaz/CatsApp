import 'package:cats/Providers/favorite_cats_provider.dart';
import 'package:cats/theme/pallete.dart';
import 'package:cats/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatInfoPage extends ConsumerWidget {
  final Cats catType;

  const CatInfoPage({super.key, required this.catType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteCatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          catType.name,
          style: const TextStyle(
              color: Palette.secondary, fontFamily: 'ProtestRiot'),
        ),
        backgroundColor: Palette.primary,
        actions: [
          IconButton(
            icon: favorites.contains(catType)
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Image.network(
                  catType.imageLink,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                catType.name,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProtestRiot'),
              ),
              const SizedBox(height: 5),
              Text(
                'Origin : ${catType.origin}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 5),
              Text(
                'MaxWeight : ${catType.maxWeight == 0 ? 'Known' : catType.maxWeight} Kg',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 5),
              Text(
                'MinWeight : ${catType.minWeight == 0 ? 'Known' : catType.minWeight} Kg',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 5),
              Text(
                'Length : ${catType.length}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 5),
              Text(
                'Intelligence : ${catType.intelligence == 0 ? 'Unknown' : catType.intelligence}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
