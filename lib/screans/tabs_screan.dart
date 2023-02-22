import 'package:flutter/material.dart';
import 'package:traveling/screans/categoriesscrean.dart';
import 'package:traveling/screans/favorite_screan.dart';
import 'package:traveling/widgets/app_drawer.dart';

class TabsScrean extends StatefulWidget {
  const TabsScrean({super.key});

  @override
  State<TabsScrean> createState() => _TabsScreanState();
}

class _TabsScreanState extends State<TabsScrean> {
  void _selectedTab(int index) {
    setState(() {
      selectedScreanIndex = index;
    });
  }

  int selectedScreanIndex = 0;
  final List screans = const [
    {
      'Screan': CategoriesScrean(),
      'Title': 'تصنيفات الرحلات',
    },
    {
      'Screan': FavortiesScrean(),
      'Title': 'الرحلات المفضلة',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: const [Icon(Icons.travel_explore)],
        title: Text(screans[selectedScreanIndex]['Title']),
      ),
      drawer: const AppDrawer(),
      body: screans[selectedScreanIndex]['Screan'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedScreanIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        unselectedFontSize: 16.5,
        onTap: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              size: 20,
            ),
            label: 'تصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 20,
            ),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
