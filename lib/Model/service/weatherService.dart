import 'package:dio/dio.dart';
import 'package:weatherapp/Network/remote/dio_helper.dart';

class WeatherService {
  static const currentWeatherMethod = 'weather';
  static const last5daysMethod = 'forecast';
  static const appid = "30ec55b6946668980272c6316642977b";
  static Future<Response<dynamic>> getCurrentWeatherData(String city) async {
    return await DioHelper.getData(
        method: currentWeatherMethod, query: {'q': city, 'appid': appid});
  }

  static Future<Response<dynamic>> getFiveDaysThreeHoursForecastData(
      String city) async {
    return await DioHelper.getData(
        method: last5daysMethod, query: {'q': city, 'appid': appid});
  }
}
