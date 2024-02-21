import 'package:dio/dio.dart';
import 'package:weatherapp/Model/service/Network/remote/dio_helper.dart';
import 'package:weatherapp/Model/service/iWeatherService.dart';
import 'package:weatherapp/core/end_points.dart';

class ApiWeatherService implements IWeatherService {
  @override
  Future<Response<dynamic>> getCurrentWeatherData(String city) async {
    return await DioHelper.getData(
        method: Endpoints.currentWeatherMethod,
        query: {'q': city, 'appid': Endpoints.appid});
  }

  @override
  Future<Response<dynamic>> getFiveDaysThreeHoursForecastData(
      String city) async {
    return await DioHelper.getData(
        method: Endpoints.last5daysMethod,
        query: {'q': city, 'appid': Endpoints.appid});
  }
}
