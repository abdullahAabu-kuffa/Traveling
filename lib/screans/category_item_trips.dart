import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';

import '../widgets/trip_item.dart';

class CategoryItemTrips extends StatelessWidget {
  const CategoryItemTrips({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filterTrips =
        Trip_data.where((element) => element.categories.contains(categoryId))
            .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: filterTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            id: filterTrips[index].id,
            title: filterTrips[index].title,
            imageUrl: filterTrips[index].imageUrl,
            duration: filterTrips[index].duration,
            tripType: filterTrips[index].tripType,
            season: filterTrips[index].season,
            activities: filterTrips[index].activities,
            program: filterTrips[index].program,
            isInSummer: filterTrips[index].isInSummer,
            isForFamilies: filterTrips[index].isForFamilies,
            isInWinter: filterTrips[index].isInWinter,
          );
        },
      ),
    );
  }
}
