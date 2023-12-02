//import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:weatherapp/Model/models/sys.dart';
import 'package:weatherapp/Model/models/weather.dart';
import 'package:weatherapp/Model/models/wind.dart';

import 'clouds.dart';
import 'coord.dart';
import 'main.dart';

class WeatherModule {
  WeatherModule({
    required coord,
    required weather,
    required base,
    required main,
    required visibility,
    required wind,
    required clouds,
    required dt,
    Sys? sys,
    required timezone,
    required id,
    required name,
    required cod,
    required weekDay,
    required time,
    required date,
    required night,
  }) {
    _weather = weather;
    _base = base;
    _clouds = clouds;
    _sys = sys;
    _cod = cod;
    _id = id;
    _weekDay = weekDay;
    _time = time;
    _date = date;
    _night = night;
    _name = name;
    _timezone = timezone;
    _wind = wind;
    _dt = dt;
    _visibility = visibility;
    _coord = coord;
    _main = main;
  }

  CoordClass? _coord;

  List<Weather>? _weather;

  String? _base;

  Main? _main;
  int? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  int? _dt;
  Sys? _sys;
  int? _timezone;
  int? _id;
  String? _name;
  int? _cod;

  String _date = "";
  String _weekDay = "";
  String _time = "";
  bool _night = false;
  bool get night => _night;

  String get weekDay => _weekDay;

  String get date => _date;
  bool get getNight => night;

  String get time => _time;

  CoordClass? get getCoord => _coord;

  List<Weather>? get getWeather => _weather;

  String? get getBase => _base;

  Main? get getMain => _main;

  int? get getVisibility => _visibility;

  Wind? get getWind => _wind;

  Clouds? get getClouds => _clouds;

  int? get getDt => _dt;

  Sys? get getSys => _sys;

  int? get getTimezone => _timezone;

  int? get getId => _id;

  String? get getName => _name;

  int? get getCod => _cod;

  factory WeatherModule.fromJson(Map<String, dynamic> json,
      {bool forecast = false}) {
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(
      json['dt'] * 1000000,
    );
    print(dateTime.difference(DateTime.now()).inDays == 0
        ? 'Today'
        : dateTime.difference(DateTime.now()).inDays == 1
            ? 'Tomorrow'
            : DateFormat.EEEE().format(dateTime).substring(0, 3));

    //time = DateFormat.jm().format(dateTime);
    // night = dateTime.hour >= 5 && dateTime.hour <= 17 ? false : true;
    // date = DateFormat.yMMMMd().format(dateTime);

// 12 Hour format:
//var d12 = DateFormat('MM/dd/yyyy, hh:mm a').format(dt); // 12/31/2000, 10:00 PM

    return WeatherModule(
      coord: forecast == false ? CoordClass.fromJson(json["coord"]) : null,
      base: json["base"],
      clouds: Clouds.fromJson(json["clouds"]),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      cod: json["cod"] ?? 0,
      dt: json["dt"],
      id: json["id"],
      main: Main.fromJson(json["main"]),
      name: json["name"] ?? "",
      sys: forecast == false ? Sys.fromJson(json["sys"]) : null,
      timezone: json["timezone"] ?? 0,
      visibility: json["visibility"],
      wind: Wind.fromJson(json["wind"]),
      weekDay: dateTime.difference(DateTime.now()).inDays == 0
          ? 'Today'
          : dateTime.difference(DateTime.now()).inDays == 1
              ? 'Tomorrow'
              : DateFormat.EEEE().format(dateTime).substring(0, 3),
      date: DateFormat.yMMMMd().format(dateTime),
      time: DateFormat.jm().format(dateTime),
      night: dateTime.hour >= 5 && dateTime.hour <= 17 ? false : true,
    );
  }

  Map<String, dynamic> toJson() => {
        "coord": getCoord!.toJson(),
        "weather": List<dynamic>.from(getWeather!.map((x) => x.toJson())),
        "base": getBase,
        "main": getMain!.toJson(),
        "visibility": getVisibility,
        "wind": getWind!.toJson(),
        "clouds": getClouds!.toJson(),
        "dt": getDt,
        //  "sys": getSys!.toJson(),
        "timezone": getTimezone,
        "id": getId,
        "name": getName,
        "cod": getCod,
        // 'dt_txt': dtTxt,
      };
}
