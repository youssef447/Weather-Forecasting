abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class GetDataLoadingState extends WeatherStates {}

class GetDataSuccessState extends WeatherStates {}

class GetDataErrorState extends WeatherStates {
  String? errMessage;
  String? get getErrMessage => errMessage;
  GetDataErrorState({this.errMessage}) {
    print(' GetDataError $errMessage');
  }
}


    
    class ChangeNavIndexState extends WeatherStates {}
  



class ForecastChangeIndexState extends WeatherStates {}

