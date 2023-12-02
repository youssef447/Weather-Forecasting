import 'package:intl/intl.dart';

class Sys {
    

    String ?_country;
     String? _sunrise;
  String? _sunset;
  String? get getSunrise => _sunrise;

  String? get getSunset => _sunset;
  String? get country => _country;


 


     Sys.fromJson(Map<String, dynamic> json){
        _country= json["country"];
        _sunrise = DateFormat.jm()
        .format(DateTime.fromMicrosecondsSinceEpoch(json['sunrise']*1000000)).toLowerCase();

         _sunset = DateFormat.jm()
        .format(DateTime.fromMicrosecondsSinceEpoch(json['sunset']*1000000)).toLowerCase();
   }

    
}

