import 'package:flutter/material.dart';
import 'package:traveling/screans/categoriesscrean.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling/screans/category_item_trips.dart';
import 'package:traveling/screans/filters_screan.dart';
import 'package:traveling/screans/tabs_screan.dart';
import 'package:traveling/screans/trip_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English
      ],
      title: 'Traveling',
      //initialRoute: '/',
      routes: {
        '/': (context) => const TabsScrean(),
        'CategoryItemTrips': (context) => const CategoryItemTrips(),
        'TripDetails': (context) => const TripDetails(),
        'CategoriesScrean': (context) => const CategoriesScrean(),
        'FilterScrean': (context) => const FilterScrean(),
      },
      theme: ThemeData(
        primaryColor: Colors.teal[800],
        fontFamily: 'Cairo',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                color: Colors.teal[700],
                fontSize: 24,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CategoriesScrean(),
    );
  }
}
