import 'package:flutter/material.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {

  var location = 'Delhi';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState function ran');
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            location = 'London';
          });
          //Navigator.pushNamed(context, '/clock');
        },
        child: Card(
          //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            //mainAxisAlignment: ,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/uk.png"),
              ),
              Text("London"),
              SizedBox(width: 40,)
            ],
          ),
        ),
      )
    );
  }
}
