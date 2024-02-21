part of 'home_screen.dart';

class Appbar extends StatelessWidget {
  final WeatherModule weatherMod;
  final double expandedHeight;
  const Appbar({super.key, required this.weatherMod, required this.expandedHeight,});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
                                  actions: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        size: 30,
                                        color: weatherMod.night == true
                                            ? Colors.white
                                            : const Color(0xff3b296b),
                                      ),
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (ctx) =>
                                            const SearchLocationScreen(),
                                      )),
                                    )
                                  ],
                                  backgroundColor: const Color(0xff131730),
                                  floating: true,
                                  // centerTitle: true,
        
                                  expandedHeight:
                                     expandedHeight,
                                  /*  leading: IconButton(
                                    icon: const Icon(Icons.menu,color: const Color(0xff3b296b),),
                                    onPressed: () {},
                                  ), */
        
                                  flexibleSpace: FlexibleSpaceBar(
                                    // expandedTitleScale: 3.5,
        
                                    background: LottieBuilder.asset(
                                      weatherMod.night == true
                                          ? 'assets/anims/night-back.json'
                                          : 'assets/anims/morning-back.json',
                                    
                                      fit: BoxFit.fill,
                                    ),
        
                                    title: FittedBox(
                                      child: Row(
                                        children: [
                                          Column(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                myLocation,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontWeight: FontWeight.bold,
                                                      color:
                                                          // cubit.isDark?Colors.white:const Color(0xff48319d),
                                                          Colors.white,
                                                    ),
                                              ),
                                              Text(
                                                '${weatherMod.getMain!.getTempMin}°c',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontWeight: FontWeight.bold,
                                                      color:
                                                          // cubit.isDark?Colors.white:const Color(0xff48319d),
                                                          Colors.white,
                                                    ),
                                              ),
                                              Text(
                                                '${weatherMod.getWeather![0].description}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                          // cubit.isDark?Colors.white:const Color(0xff48319d),
                                                          Colors.white,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Lottie.asset(
                                            weatherMod.night == false
                                                ?
                                                //morning conditions
                                                weatherMod.getWeather![0].main!
                                                            .toLowerCase() ==
                                                        'rain'
                                                    ? 'assets/anims/morning-rain.json'
                                                    : weatherMod.getWeather![0]
                                                                .main!
                                                                .toLowerCase() ==
                                                            'clear'
                                                        ? 'assets/anims/morning-clear.json'
                                                        : weatherMod.getWeather![0]
                                                                    .main!
                                                                    .toLowerCase() ==
                                                                'clouds'
                                                            ? 'assets/anims/morning-cloudy.json'
                                                            : 'assets/anims/morning-snow.json'
                                                :
        
                                                //night conditions
                                                weatherMod.getWeather![0].main!
                                                            .toLowerCase() ==
                                                        'rain'
                                                    ? 'assets/anims/night-rain.json'
                                                    : weatherMod.getWeather![0]
                                                                .main!
                                                                .toLowerCase() ==
                                                            'clear'
                                                        ? 'assets/anims/night-clear.json'
                                                        : weatherMod.getWeather![0]
                                                                    .main!
                                                                    .toLowerCase() ==
                                                                'clouds'
                                                            ? 'assets/anims/night-cloudy.json'
                                                            : 'assets/anims/night-snow.json',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
  }
}