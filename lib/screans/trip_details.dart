import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});
  Widget buildSelectedTrip(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListView(BuildContext context, Widget child) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip =
        Trip_data.firstWhere((element) => element.id == tripId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          selectedTrip.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(selectedTrip.imageUrl),
            buildSelectedTrip(context, 'الانشطة'),
            buildListView(
              context,
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  child: Text(selectedTrip.activities[index]),
                ),
              ),
            ),
            buildSelectedTrip(context, 'البرنامج اليومي'),
            buildListView(
              context,
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
