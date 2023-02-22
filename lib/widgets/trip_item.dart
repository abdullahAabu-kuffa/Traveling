import 'package:flutter/material.dart';
import 'package:traveling/models/trip.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.activities,
    required this.program,
    required this.isInSummer,
    required this.isForFamilies,
    required this.isInWinter,
  });
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final List<String> activities;
  final List<String> program;
  final bool isInSummer;
  final bool isForFamilies;
  final bool isInWinter;

  String get seasonText {
    switch (season) {
      case Season.winter:
        return 'شيتاء';
      case Season.summer:
        return 'صيف';
      case Season.autumn:
        return 'خريف';
      case Season.spring:
        return 'ربيع';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.exploration:
        return 'استكشاف';
      case TripType.recovery:
        return 'نقاهة';
      case TripType.activities:
        return 'انشطة';
      case TripType.therapy:
        return 'معالجة';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          'TripDetails',
          arguments: id,
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8)
                      ],
                      stops: const [0.5, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 5),
                      Text("$duration ايام"),
                    ],
                  ),
                  Row(
                    children: [
                      isInSummer
                          ? Icon(Icons.wb_sunny, color: Colors.yellow[500])
                          : Icon(Icons.cloud, color: Colors.grey[500]),
                      const SizedBox(width: 5),
                      isInSummer ? Text(seasonText) : Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 5),
                      Text(tripTypeText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
