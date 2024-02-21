import 'package:weatherapp/Model/models/weatherModule.dart';
import 'package:weatherapp/Model/service/iWeatherService.dart';

import '../../constants.dart';

class WeatherRepo {
  final IWeatherService _weatherService;
  WeatherRepo(this._weatherService);
  Future<WeatherModule> getCurrentWeatherData() async {
    print('loading');

    final response =
        await _weatherService.getCurrentWeatherData(myLocation.split(', ')[0]);

    //make repository class and handle this part and just call here instance of repo
    return WeatherModule.fromJson(response.data);
  }

  Future<List<WeatherModule>> getFiveDaysThreeHoursForecastData() async {
    final response = await _weatherService
        .getFiveDaysThreeHoursForecastData(myLocation.split(', ')[0]);

    var tmp = response.data['list'] as List;
    print('ooooh ${tmp[0]}');

    final forecastModule = tmp.map((e) {
      print('hhh ${WeatherModule.fromJson(e, forecast: true).weekDay}');
      return WeatherModule.fromJson(e, forecast: true);
    }).toList();

    return forecastModule;
  }
}
