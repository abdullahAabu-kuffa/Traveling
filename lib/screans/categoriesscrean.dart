import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';
import 'package:traveling/widgets/category.item.dart';

class CategoriesScrean extends StatelessWidget {
  const CategoriesScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 7.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Category_data.map(
        (e) => CategoryItem(
          id: e.id,
          title: e.title,
          imageUrl: e.imageUrl,
        ),
      ).toList(),
    );
  }
}
