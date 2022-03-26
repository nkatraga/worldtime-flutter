import 'package:flutter/material.dart';
import 'city.dart';

class LocationCard extends StatelessWidget {
  //const LocationCard({Key? key}) : super(key: key);

  final City city;

  LocationCard({required this.city});


  @override
  Widget build(BuildContext context) {
    String locationCity = city.location.substring(city.location.indexOf('/')+1);
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(city.flagPath),
            ),
            Text(locationCity),
            SizedBox(width: 40,)
          ],
        ),
      ),
    );
  }
}
