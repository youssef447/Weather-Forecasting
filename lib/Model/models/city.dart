/* import 'package:intl/intl.dart';

class City {
  City({
    required sunrise,
    required sunset,
  }){
    _sunrise=sunrise;
    _sunset=sunset;
    }

  late String _sunrise;
 late  String _sunset;
 String get sunrise => _sunrise;


  String get sunset => _sunset;


  factory City.fromJson(Map<String, dynamic> json) => City(
      sunrise: DateFormat.jm()
          .format(
              DateTime.fromMicrosecondsSinceEpoch(json['sunrise'] * 1000000))
          .toLowerCase(),
      sunset: DateFormat.jm()
          .format(DateTime.fromMicrosecondsSinceEpoch(json['sunset'] * 1000000))
          .toLowerCase());

  Map<String, dynamic> toJson() => {
        "sunrise": _sunrise,
        "sunset": _sunset,
      };
}
 */


//not returned with api