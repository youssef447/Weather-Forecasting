import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/Model/models/weatherModule.dart';

import '../view-model/Cubits/WeatherCubit.dart';
import '../view-model/Cubits/WeatherStates.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModule module;
  const WeatherCard({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          var cubit = WeatherCubit.get(context);
            WeatherModule weatherMod= cubit.currentWeatherResponse.data as WeatherModule;
          return Stack(
            alignment: Alignment.topRight,
            children: [
              ClipPath(
                clipper: _CustomClipper(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    color: Color(0xff4d32a4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            '${module.getMain!.getTemp}°c',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 43),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'min: ${module.getMain!.getTempMin} / max: ${module.getMain!.getTempMax}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: const Color(0Xff9683cd)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                '${module.getName}, ${module.getSys!.country}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Spacer(),
                              Text(
                                '${module.getWeather![0].description}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Lottie.asset(
                height: 120,
                width:100,                
                weatherMod.getNight == false
                    ?
                    //morning conditions
                    weatherMod.getWeather![0].main!.toLowerCase() ==
                            'rain'
                        ? 'assets/anims/morning-rain.json'
                        : weatherMod.getWeather![0].main!
                                    .toLowerCase() ==
                                'clear'
                            ? 'assets/anims/morning-clear.json'
                            : weatherMod.getWeather![0].main!
                                        .toLowerCase() ==
                                    'clouds'
                                ? 'assets/anims/morning-cloudy.json'
                                : 'assets/anims/morning-snow.json'
                    :

                    //night conditions
                    weatherMod.getWeather![0].main!.toLowerCase() ==
                            'rain'
                        ? 'assets/anims/night-rain.json'
                        : weatherMod.getWeather![0].main!
                                    .toLowerCase() ==
                                'clear'
                            ? 'assets/anims/night-clear.json'
                            : weatherMod.getWeather![0].main!
                                        .toLowerCase() ==
                                    'clouds'
                                ? 'assets/anims/night-cloudy.json'
                                : 'assets/anims/night-snow.json',
              ),
            ],
          );
        }));
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 3);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
