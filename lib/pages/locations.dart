import 'package:flutter/material.dart';
import 'package:worldtime/pages/city.dart';
import 'location_card.dart';
import 'city.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  
  List<City> cities = [
    City(location: 'Europe/London', flagImage: 'uk.png'),
    City(location: 'America/Chicago', flagImage: 'usa.png')
  ];

  var location = 'Delhi';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print('initState function ran');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
      ),
      body: Column(
        children: cities.map((e) => GestureDetector(
          onTap:() {
            Navigator.pushReplacementNamed(context, '/loading',arguments: {'locationUrl': e.location});
            },
            child: LocationCard(city: e))).toList()
      )
    );
  }
}
