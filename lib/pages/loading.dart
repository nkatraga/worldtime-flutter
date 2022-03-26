import 'package:flutter/material.dart';
import 'package:worldtime/services/get_local_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var loadingPageText = "Loading..";
  Map cityUrlData = {};

  void setupWorldTime(Map cityUrlData) async {
    LocalTime instance = LocalTime(url: cityUrlData['locationUrl']);
    await instance.getTime();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, '/clock', arguments: {
      'time': instance.localTime,
      'location': instance.location,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map cityUrlDataDefault = {'locationUrl': 'Europe/London'};

    //On first load we haven't clicked on location yet, so no context is passed to loading route. Setting it to default to London

    if (ModalRoute.of(context)!.settings.arguments != null) {
      cityUrlData = ModalRoute.of(context)!.settings.arguments as Map;
    } else {
      cityUrlData = cityUrlDataDefault;
    }

    setupWorldTime(cityUrlData); //this takes some time because it's async. App will show the below Scaffold while waiting for this function.

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
