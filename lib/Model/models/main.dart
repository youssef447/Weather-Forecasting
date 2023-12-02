class Main {
   /*  Main({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.humidity,
        //required this.seaLevel,
       // required this.grndLevel,
    }); */

    int? _temp;
    int ?_feelsLike;
    int ?_tempMin;
    int? _tempMax;
    int ?_pressure;
    int ?_humidity;
     int? _seaLevel;
    int ?_grndLevel; 
   int?get getTemp => _temp;


   int?get getFeelsLike => _feelsLike;


  int? get getTempMin => _tempMin;


  int? get getTempMax => _tempMax;


   int?get getPressure => _pressure;


   int?get getHumidity => _humidity;


  get getSeaLevel => _seaLevel;


  get getGrndLevel => _grndLevel; 


     Main.fromJson(Map<String, dynamic> json){ 
        _temp=json["temp"].toInt()-272??0;
         _feelsLike= json["feels_like"].toInt()-272??0;
        _tempMin= json["temp_min"].toInt()-272??0;
         _tempMax= json["temp_max"].toInt()-272??0;
         _pressure= json["pressure"]??0;
         _humidity= json["humidity"]??0;
        _seaLevel= json["sea_level"]??0;
        _grndLevel= json["grnd_level"]??0;
  }
    Map<String, dynamic> toJson() => {
        "temp": getTemp,
        "feels_like": getFeelsLike,
        "temp_min": getTempMin,
        "temp_max": getTempMax,
        "pressure": getPressure,
        "humidity": getHumidity,
        //"sea_level": seaLevel,
        //"grnd_level": grndLevel,
    };
}


