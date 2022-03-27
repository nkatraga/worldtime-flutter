import 'package:flutter/material.dart';
import 'package:worldtime/pages/city.dart';
import 'location_card.dart';
import 'city.dart';
import 'dart:async';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

//Debouncer function built from this video and some other articles https://www.youtube.com/watch?v=-EUsRa2G1zk
//Don't quite understand how it works but it does.
//The idea is it only does the search once you pause typing for "pauseDuration". Otherwise it will search for every letter - which is lot of load on the server

class Debouncer {
  final int pauseDuration;
  //VoidCallback action = (){};
  Timer _timer = Timer(Duration(milliseconds: 500),(){});

  Debouncer({required this.pauseDuration});

  run(VoidCallback action){
    if (_timer != null){
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: pauseDuration), action);
  }

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

  List<City> filteredCities = [City(url: 'Europe/London', location: 'London', flagImage: 'uk.png')];

  final _debouncer = Debouncer(pauseDuration: 500);

  var location = 'Delhi';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredCities = cities;
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
      body: Container(
        constraints: BoxConstraints(maxHeight: 700),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredCities.length,
                  itemBuilder: (context, index){
                return GestureDetector(
                    onTap:() {
                  Navigator.pushReplacementNamed(context, '/loading',arguments: {'location': filteredCities[index]});
                },
                    child: LocationCard(city: filteredCities[index],) );
              }),
            ),
            TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: 'Search for city..'
              ),
              onChanged: (string){
                _debouncer.run((){
                  setState(() {
                    filteredCities = cities.where((c) =>
                    (c.location.toLowerCase().contains(string.toLowerCase()))
                    ).toList();
                  });
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}
