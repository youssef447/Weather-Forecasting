import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/Model/apis/Api_response.dart';
import 'package:weatherapp/constants.dart';
import 'package:weatherapp/core/styles/app_colors.dart';
import 'package:weatherapp/view/SearchLocationScreen.dart';

import '../../Model/models/weatherModule.dart';
import '../../view-model/Cubits/WeatherCubit.dart';
import '../../view-model/Cubits/WeatherStates.dart';
import '../forcastContainer.dart';
import '../grid_item.dart';
part 'forcast_chart.dart';
part 'sliver_appbar.dart';
part 'info_grids.dart';
part 'title_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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

          return Scaffold(
            body: state is GetDataErrorState
                ? Center(
                    child: Text(
                      'Error getting Weather Data',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : state is GetDataErrorState
                    ? Center(
                        child: Text(
                          'Error getting Forecast Data',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : cubit.allLoaded
                        ? Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: AppColors.containerGradiant),
                            ),
                            child: CustomScrollView(
                              slivers: [
                                Appbar(
                                  weatherMod: weatherMod!,
                                  expandedHeight: constraints.maxHeight * 0.4,
                                ),
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                    ),
                                    child: Column(
                                      children: [
                                        const TitleDivider(),
                                        SizedBox(
                                          height: constraints.maxHeight * 0.25,
                                          child: ForecastChart(
                                            forecastMod: forecastMod!,
                                            cubit: cubit,
                                          ),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * 0.4,
                                          child: InfoGrids(
                                            cubit: cubit,
                                            weatherMod: weatherMod,
                                            forecastMod: forecastMod,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: AppColors.containerGradiant,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.indicatorColor,
                                backgroundColor: AppColors.defaultColor,
                              ),
                            ),
                          ),
          );
        }),
      );
    });
  }
}
