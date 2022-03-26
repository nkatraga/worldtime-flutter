import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class LocalTime {
  String url;
  String localTime = 'Default time';
  String location = 'Default location';
  bool isDaytime = true;
  LocalTime({required this.url});

  Future<void> getTime() async {
    try {

      Response myJson =
      await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map myJsonData = jsonDecode(myJson.body);
      String jsonTimeStr = myJsonData['datetime'];

      DateTime datetimeThere = DateTime.parse(jsonTimeStr.substring(0,26)); //DateTime.parse() automatically adds the offset, resulting in a DateTime object that is always set to UTC. So removing the offset and then parsing.

      isDaytime = ((datetimeThere.hour>5) && (datetimeThere.hour<20))? true : false;
      localTime = DateFormat.jm().format(datetimeThere);
      location = url.substring(url.indexOf('/')+1);
    }
    catch (e) {
      localTime = "Couldn't get time from api";

    }

  }
}
