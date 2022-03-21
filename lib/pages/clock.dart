import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/locations');
                      },
                      icon: Icon(Icons.house)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.agriculture), Text("Seoul")],
                  ),
                  Text(
                    "6:57 PM",
                    style: TextStyle(fontSize: 50),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Image(
              image: NetworkImage("https://source.unsplash.com/user/c_v_r"),
              fit: BoxFit.cover,
            ),
            flex: 1,
          )
        ],
      ),
    ));
  }
}
