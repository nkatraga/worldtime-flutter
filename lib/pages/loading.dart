import 'package:flutter/material.dart';
import 'package:worldtime/services/get_local_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'city.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var loadingPageText = "Loading..";
  Map cityData = {};

  void setupWorldTime(Map cityUrlData) async {
    LocalTime instance = LocalTime(city: cityData['location']);
    await instance.getTime();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, '/clock', arguments: {
      'time': instance.localTime,
      'location': instance.location,
      'isDaytime': instance.isDaytime,
      'flagImage': cityData['location'].flagImage,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map cityDefault = {'location': City(url: 'Europe/London', location: 'London', flagImage: 'uk.png')};

    //On first load we haven't clicked on a location cad yet, so no context is passed to loading route. Setting it to default to London

    if (ModalRoute.of(context)!.settings.arguments != null) {
      cityData = ModalRoute.of(context)!.settings.arguments as Map;
    } else {
      cityData = cityDefault;
    }

    setupWorldTime(cityData); //this takes some time because it's async. App will show the below Scaffold while waiting for this function.

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
          child: SpinKitSpinningLines(
        color: Colors.amber,
        size: 150.0,
        lineWidth: 7.0,
      )),
    );
  }
}
