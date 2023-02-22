import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});
  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          'CategoryItemTrips',
          arguments: {
            'id': id,
            'title': title,
          },
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
