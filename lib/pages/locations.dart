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

  //flags images are from https://www.countries-ofthe-world.com/flags-of-the-world.html - names shortened
  List<City> cities = [
    City(url: 'Europe/London', location: 'London', flagImage: 'uk.png'),
    City(url: 'America/Chicago', location: 'Chicago', flagImage: 'usa.png'),
    City(url: 'Europe/Athens', location: 'Athens', flagImage: 'greece.png'),
    City(url: 'Africa/Cairo', location: 'Cairo', flagImage: 'egypt.png'),
    City(url: 'Africa/Nairobi', location: 'Nairobi', flagImage: 'kenya.png'),
    City(url: 'Asia/Kolkata', location: 'New Delhi', flagImage: 'india.png'),
    City(url: 'America/New_York', location: 'New York', flagImage: 'usa.png'),
    City(url: 'Asia/Seoul', location: 'Seoul', flagImage: 'south_korea.png'),
    City(url: 'Asia/Jakarta', location: 'Jakarta', flagImage: 'indonesia.png'),
    City(url: 'Africa/Cairo', location: 'Cairo', flagImage: 'egypt.png'),
    City(url: 'Africa/Nairobi', location: 'Nairobi', flagImage: 'kenya.png'),
    City(url: 'Asia/Kolkata', location: 'New Delhi', flagImage: 'india.png'),
    City(url: 'America/New_York', location: 'New York', flagImage: 'usa.png'),
    City(url: 'Asia/Seoul', location: 'Seoul', flagImage: 'south_korea.png'),
    City(url: 'Asia/Jakarta', location: 'Jakarta', flagImage: 'indonesia.png'),
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
     /* body: Column(
        children: cities.map((e) => GestureDetector(
          onTap:() {
            Navigator.pushReplacementNamed(context, '/loading',arguments: {'location': e});
            },
            child: LocationCard(city: e))).toList()
      )*/
      body: ListView.builder(
        itemCount: cities.length,
          itemBuilder: (context, index){
        return GestureDetector(
            onTap:() {
          Navigator.pushReplacementNamed(context, '/loading',arguments: {'location': cities[index]});
        },
            child: LocationCard(city: cities[index],) );
      }),
    );
  }
}
