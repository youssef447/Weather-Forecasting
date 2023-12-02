import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Network/local/cach_helper.dart';
import 'package:weatherapp/Network/remote/dio_helper.dart';
import 'package:weatherapp/view-model/Cubits/WeatherCubit.dart';
import 'package:weatherapp/Model/service/dbService.dart';

import 'package:weatherapp/shared/components.dart';
import 'package:weatherapp/view/splashScreen.dart';

import 'constants.dart';
import 'shared/styles/themes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: const Color(0xff3b296b),
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor:
        const Color.fromARGB(255, 156, 131, 220).withOpacity(0.1),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  DioHelper.init(baseUrl: baseUrl);
  await getAddress();
 /*  CitiesNames = await getAllCities();
  for(var name in CitiesNames){
    print('${name.name} ,${name.countryCode}');
  } */

  DbHealper database = DbHealper();
  await database.sqflite();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => WeatherCubit()..getCurrentWeatherData()
            //..getForecastData()),
            ),
        child: MaterialApp(
          title: 'Weather app',
          debugShowCheckedModeBanner: false, theme: lightTheme,
          darkTheme: darkTheme,

          // themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
          themeMode: ThemeMode.dark,
          home: const SplashScreen(),
        ));
  }
}
