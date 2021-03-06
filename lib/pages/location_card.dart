import 'package:flutter/material.dart';
import 'city.dart';

class LocationCard extends StatelessWidget {
  //const LocationCard({Key? key}) : super(key: key);

  final City city;
  final flagImagesLocation = 'assets/images/';

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
              backgroundImage: AssetImage(flagImagesLocation+city.flagImage),
            ),
            SizedBox(width: 10,),
            Text(locationCity),
            SizedBox(width: 40,)
          ],
        ),
      ),
    );
  }
}
