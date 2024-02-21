import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/Model/models/weatherModule.dart';

class ForcastContainer extends StatelessWidget {
  final WeatherModule module;
    final Color color;

  const ForcastContainer({super.key, required this.module,required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,

      child: Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        shadowColor:const Color.fromARGB(255, 14, 2, 37),
        color:  color,//:const Color(0xff3c2e73) ,
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Column(
            
            children: [
              FittedBox(
                child: Text(
                  module.time,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold,),
                ),
              ),
              Expanded(
                child: Lottie.asset( module.night == false
                    ?
                    //morning conditions
                    module.getWeather![0].main!.toLowerCase() == 'rain'
                        ? 'assets/anims/morning-rain.json'
                        : module.getWeather![0].main!.toLowerCase() == 'clear'
                            ? 'assets/anims/morning-clear.json'
                            : module.getWeather![0].main!.toLowerCase() ==
                                    'clouds'
                                ? 'assets/anims/morning-cloudy.json'
                                : 'assets/anims/morning-snow.json'
                    :
                
                    //night conditions
                    module.getWeather![0].main!.toLowerCase() == 'rain'
                        ? 'assets/anims/night-rain.json'
                        : module.getWeather![0].main!.toLowerCase() == 'clear'
                            ? 'assets/anims/night-clear.json'
                            : module.getWeather![0].main!.toLowerCase() ==
                                    'clouds'
                                ? 'assets/anims/night-cloudy.json'
                                : 'assets/anims/night-snow.json'),
              ),
              FittedBox(
                child: Text(
                  '${module.getMain!.getTemp}°c',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
