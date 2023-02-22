import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTileDrawer(
      String title, String name, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.teal[600],
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(height: 20),
          buildListTileDrawer(
            'الرحلات',
            '/',
            Icons.card_travel,
            context,
          ),
          const Divider(),
          buildListTileDrawer(
            'تصفية',
            'FilterScrean',
            Icons.card_travel,
            context,
          ),
        ],
      ),
    );
  }
}
