import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:worldtime/pages/city.dart';

class LocalTime {
  City city;
  String localTime = 'Default time';
  String location = 'Default location';
  bool isDaytime = true;
  LocalTime({required this.city});

  Future<void> getTime() async {
    try {

      Response myJson =
      await get(Uri.parse('https://worldtimeapi.org/api/timezone/${city.url}'));
      Map myJsonData = jsonDecode(myJson.body);
      String jsonTimeStr = myJsonData['datetime'];

      DateTime datetimeThere = DateTime.parse(jsonTimeStr.substring(0,26)); //DateTime.parse() automatically adds the offset, resulting in a DateTime object that is always set to UTC. So removing the offset and then parsing.

      isDaytime = ((datetimeThere.hour>5) && (datetimeThere.hour<20))? true : false;
      localTime = DateFormat.jm().format(datetimeThere);
      location = city.location;
    }
    catch (e) {
      localTime = "Couldn't get time from api";

    }

  }
}
