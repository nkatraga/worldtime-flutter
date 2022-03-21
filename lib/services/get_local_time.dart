import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class LocalTime {
  String url;
  String localTimeStr;
  LocalTime({required this.url, required this.localTimeStr});

  Future<void> getTime() async {
    Response myJson = await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    //return myJson.body;
  Map myJsonData = jsonDecode(myJson.body);
  String jsonTimeStr = myJsonData['datetime'];
  String timeOffsetStr = myJsonData['utc_offset'];
  int timeOffset = int.parse(timeOffsetStr.substring(1, 3));
  DateTime datetimeThere = DateTime.parse(jsonTimeStr).add(
      Duration(hours: timeOffset));

  localTimeStr = DateFormat.jm().format(datetimeThere);
}
}