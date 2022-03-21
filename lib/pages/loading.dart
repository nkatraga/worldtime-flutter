import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:worldtime/services/get_local_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var textShowing = "Loading..";

  void setupWorldTime() async {
    LocalTime instance = LocalTime(url: 'Europe/London', localTimeStr: 'loading');
    await instance.getTime();

    print(instance.localTimeStr);

    setState(() {
      textShowing = instance.localTimeStr;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(textShowing)
      ),
    );
  }
}


