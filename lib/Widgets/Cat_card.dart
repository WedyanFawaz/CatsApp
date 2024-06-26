import 'package:cats/Theme/pallete.dart';
import 'package:cats/model/cat_model.dart';
import 'package:flutter/material.dart';
import '../Pages/Cat_Info_Page.dart';

class CatCard extends StatelessWidget {
  final Cats catType;

  const CatCard({super.key, required this.catType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatInfoPage(catType: catType),
          ),
        );
      },
      child: Container(
        color: Palette.secondary,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(catType.imageLink),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                catType.name,
                style: const TextStyle(
                  color: Palette.primary,
                  fontSize: 20,
                  fontFamily: 'ProtestRiot',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
