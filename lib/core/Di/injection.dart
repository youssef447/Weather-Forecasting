
import 'package:get_it/get_it.dart';
import 'package:weatherapp/Model/repositories/weather_repo.dart';
import 'package:weatherapp/Model/service/locationService.dart';
import 'package:weatherapp/Model/service/weatherService.dart';

import '../../Model/service/ILocationService.dart';

final locators = GetIt.instance;

configurationDependencies() {
  locators.registerLazySingleton<WeatherRepo>(
    () => WeatherRepo(ApiWeatherService()),
  );

  locators.registerLazySingleton<ILocationService>(
    () => LocationService(),
  );
}
