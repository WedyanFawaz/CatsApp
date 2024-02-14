import 'package:cats/main.dart';
import 'package:cats/widgets/cat_car.dart';
import 'package:flutter/material.dart';

class CatsHomeScreen extends StatelessWidget {
  const CatsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cats'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: cats.length,
        itemBuilder: (context, index) {
          final cat = cats[index];
          return CatCard(cat: cat);
        },
      ),
    );
  }
}
