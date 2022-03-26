import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  Map clockData = {};
  final flagImagesLocation = 'assets/images/';

  @override
  Widget build(BuildContext context) {
    clockData = ModalRoute.of(context)!.settings.arguments as Map;

    String timeImage = (clockData['isDaytime']) ? "day.png" : "night.png";
    Color? bgColor =
        (clockData['isDaytime']) ? Colors.blue : Colors.indigo[900];
    Color? fontColor = (clockData['isDaytime']) ? Colors.black : Colors.grey[400];

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/$timeImage'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    //color: Colors.blue[500],
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 110,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/locations');
                            },
                            icon: Icon(
                              Icons.edit_location,
                              color: fontColor,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  flagImagesLocation + clockData['flagImage']),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              clockData['location'],
                              style: TextStyle(
                                fontSize: 50,
                                color: fontColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          clockData['time'],
                          style: TextStyle(fontSize: 70, color: fontColor),
                        )
                      ],
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                )
              ],
            ),
          ),
        ));
  }
}
