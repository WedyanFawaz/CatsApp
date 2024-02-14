import 'package:flutter/material.dart';
import 'package:cats/model/cat.dart';
import 'package:cats/screens/cat_details_screen.dart';

/// This widget shows a card that shows the image and name of the cat
class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CatDetailsScreen(cat: cat);
        }));
      },
      child: Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              // Cat Image
              Expanded(
                child: Image.network(
                    width: double.infinity, fit: BoxFit.cover, cat.imageLink),
              ),
              // Cat Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cat.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
              )
            ],
          )),
    );
  }
}
