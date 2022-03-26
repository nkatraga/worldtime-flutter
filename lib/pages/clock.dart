import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {

  Map clockData = {};

  @override
  Widget build(BuildContext context) {

    clockData = ModalRoute.of(context)!.settings.arguments as Map;

    String timeImage = (clockData['isDaytime'])? "day.png":"night.png";
    Color? bgColor = (clockData['isDaytime'])? Colors.blue : Colors.indigo[900];


    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$timeImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                //color: Colors.blue[500],
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/locations');
                        },
                        icon: Icon(Icons.house)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.agriculture),
                        Text(clockData['location'],style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),
                    Text(
                      clockData['time'],
                      style: const TextStyle(fontSize: 50),
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
              ),
              flex: 1,
            )
          ],
        ),
      ),
    ));
  }
}
