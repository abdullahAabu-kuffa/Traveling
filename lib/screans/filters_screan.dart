import 'package:flutter/material.dart';
import 'package:traveling/widgets/app_drawer.dart';

class FilterScrean extends StatefulWidget {
  const FilterScrean({super.key});

  @override
  State<FilterScrean> createState() => _FilterScreanState();
}

class _FilterScreanState extends State<FilterScrean> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  late Function updatValue;
  Widget buildSwitchListView(String title, var currentValue, updatValue) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontSize: 20)),
      value: currentValue,
      onChanged: updatValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'تصفية',
          ),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            buildSwitchListView(
              'الرحلات الصيفية فقط',
              _isInSummer,
              (newValue) {
                setState(() {
                  _isInSummer = newValue;
                });
              },
            ),
            buildSwitchListView(
              'الرحلات الشتاء فقط',
              _isInWinter,
              (newValue) {
                setState(() {
                  _isInWinter = newValue;
                });
              },
            ),
            buildSwitchListView(
              'الرحلات العائلية فقط',
              _isForFamily,
              (newValue) {
                setState(() {
                  _isForFamily = newValue;
                });
              },
            ),
          ],
        ));
  }
}
