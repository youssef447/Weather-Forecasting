import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Model/repositories/weather_repo.dart';
import 'package:weatherapp/Network/local/cach_helper.dart';

import '../../Model/apis/Api_response.dart';
import '../../Model/models/gridItem.dart';
import 'WeatherStates.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());
  static WeatherCubit get(ctx) => BlocProvider.of(ctx);

  //--------attributes--------
  bool isDark = false;
  int foreCastTapIndex = 0;
  bool allLoaded = false;
   ApiResponse currentWeatherResponse = ApiResponse.initial('Empty data');
     ApiResponse foreCastResponse = ApiResponse.initial('Empty data');


  List<GridItem> gridItem = [];

  //--------attributes--------

  changeAppThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'darkMode', value: isDark);
    }
  }

  int currentNavIndex = 0;
  changeNavIndex(int index) {
    currentNavIndex = index;
    emit(ChangeNavIndexState());
  }

  getCurrentWeatherData() async {
    print('loading');

    emit(GetDataLoadingState());
    WeatherRepo.getCurrentWeatherData().then((value) {
       // WeatherModule weatherMod= currentWeatherResponse.data as WeatherModule;
      gridItem.add(
        GridItem(
            iconData: Icons.wb_sunny_outlined,
            title: "sunrise",
            value: value.getSys!.getSunrise!),
      );
      gridItem.add(
        GridItem(
            iconData: Icons.wb_sunny_outlined,
            title: "sunset",
            value:value.getSys!.getSunset!),
      );
      gridItem.add(
        GridItem(
          iconData: Icons.air_outlined,
          title: "wind speed",
        ),
      );
      gridItem.add(
        GridItem(
          iconData: Icons.water_drop_outlined,
          title: "Humidity",
        ),
      );
      gridItem.add(
        GridItem(
          iconData: Icons.thermostat_outlined,
          title: "feels like",
        ),
      );
      currentWeatherResponse=ApiResponse.completed(value);

      getForecastData();
    }).catchError((onError) {
      emit(GetDataErrorState(errMessage: onError.toString()));
    });
  }

  getForecastData() {
    WeatherRepo.getFiveDaysThreeHoursForecastData().then((value) {
      foreCastResponse=ApiResponse.completed(value);
      allLoaded = true;

      emit(GetDataSuccessState());
    }).catchError((onError) {
      emit(GetDataErrorState(errMessage: onError.toString()));
    });
  }

  selectForeCast(int index) {
    foreCastTapIndex = index;
    emit(ForecastChangeIndexState());
  }
}
