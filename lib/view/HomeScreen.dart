import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/Model/apis/Api_response.dart';
import 'package:weatherapp/constants.dart';
import 'package:weatherapp/view/SearchLocationScreen.dart';

import '../Model/models/weatherModule.dart';
import '../view-model/Cubits/WeatherCubit.dart';
import '../view-model/Cubits/WeatherStates.dart';
import 'additionalInfoGridItem.dart';
import 'forcastContainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: ((context, state) {
        var cubit = WeatherCubit.get(context);
        WeatherModule? weatherMod;
        cubit.currentWeatherResponse.status == Status.completed
            ? weatherMod = cubit.currentWeatherResponse.data as WeatherModule
            : null;

        List<WeatherModule>? forecastMod;
        cubit.foreCastResponse.status == Status.completed
            ? forecastMod = cubit.foreCastResponse.data as List<WeatherModule>
            : null;

        print(MediaQuery.of(context).padding.top);

        return Scaffold(
          //resizeToAvoidBottomInset: false,
          body: state is GetDataErrorState
              ? Center(
                  child: FittedBox(
                    child: Text(
                      'Error getting Weather Data',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              : state is GetDataErrorState
                  ? Center(
                      child: FittedBox(
                        child: Text(
                          'Error getting Forecast Data',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    )
                  : cubit.allLoaded
                      ? CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              actions: [
                                IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: weatherMod!.night == true
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
                                  (MediaQuery.of(context).size.height -
                                          MediaQuery.of(context).padding.top) *
                                      0.5,
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
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                //titlePadding: EdgeInsets.only(bottom:(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.5,left: 20),

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
                            ),
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff131730),
                                          Color(0xff3b296b),
                                          Color(0xff3b296b),
                                          Color(0xff131730),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            '5 Days / 3 Hours forecast',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 102, 97, 120),
                                                  //spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      2), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: const Divider(
                                              /*  indent: 15,
                                      endIndent: 15, */
                                              thickness: 2,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.28,
                                              child: ListView.separated(
                                                  //  padding: const EdgeInsets.symmetric(
                                                  //    vertical: 10, horizontal: 15),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              cubit
                                                                  .selectForeCast(
                                                                      index);
                                                            },
                                                            child:
                                                                forcastContainer(
                                                              color: cubit.foreCastTapIndex ==
                                                                      index
                                                                  ? const Color(
                                                                      0xff48319d)
                                                                  : const Color(
                                                                      0xff3c2e73),
                                                              module:
                                                                  forecastMod![
                                                                      index],
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          forecastMod[index]
                                                              .weekDay,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleMedium!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Tara'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                  itemCount:
                                                      forecastMod!.length),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: const Color(0xff48319d)
                                                    .withOpacity(0.5),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            child: GridView.builder(
                                              itemCount: 5,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      childAspectRatio: 2 / 2.2,
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 20,
                                                      crossAxisCount: 3),
                                              itemBuilder: (context, index) {
                                                return Grids(
                                                    icon: cubit.gridItem[index]
                                                        .iconData,
                                                    title: cubit
                                                        .gridItem[index].title,
                                                    value: index == 0
                                                        ? weatherMod!
                                                            .getSys!.getSunrise!
                                                        : index == 1
                                                            ? weatherMod!
                                                                .getSys!
                                                                .getSunset!
                                                            : index == 2
                                                                ? '${forecastMod![cubit.foreCastTapIndex].getWind!.speed!} m/s'
                                                                : index == 3
                                                                    ? '${forecastMod![cubit.foreCastTapIndex].getMain!.getHumidity!} %'
                                                                    : '${forecastMod![cubit.foreCastTapIndex].getMain!.getFeelsLike!}°c');
                                              },
                                              physics:
                                                  //       const BouncingScrollPhysics(),
                                                  const NeverScrollableScrollPhysics(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff131730),
                                Color(0xff3b296b),
                                Color(0xff3b296b),
                                Color(0xff131730),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 101, 93, 133),
                              backgroundColor: Color(0xff3c2e73),
                            ),
                          ),
                        ),
        );
      }),
    );
  }
}
