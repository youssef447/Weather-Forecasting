import 'package:dio/dio.dart';

abstract class IWeatherService{
   Future<Response<dynamic>> getCurrentWeatherData(String city);
    Future<Response<dynamic>> getFiveDaysThreeHoursForecastData(
      String city);
}