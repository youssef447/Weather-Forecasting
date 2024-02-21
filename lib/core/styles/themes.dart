import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/core/styles/app_colors.dart';

import '../../constants.dart';

ThemeData darkTheme = ThemeData(
  //primarySwatch: defaultColor,
  
  scaffoldBackgroundColor:  AppColors.defaultColor, // const Color(0XFF333739),
  
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    /*systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),*/
    backgroundColor:  Color(0xff21203e),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.defaultColor,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Color(0xFF333739),
  ),
  dividerTheme: const DividerThemeData(thickness: 1.5, color: Colors.white),
  textTheme:  const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 45.0,
       fontFamily: "Tara",
      //fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
       headlineMedium: TextStyle(
        fontFamily: "Tara",
      //fontWeight: FontWeight.w600,
      color: Colors.white,
    ), 
    titleMedium: TextStyle(
        fontSize: 14.0,
        // fontWeight: FontWeight.w600,
        color: Colors.white,
        fontWeight: FontWeight.normal
        //height: 1.3,
        ),
    titleSmall: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color(0XFF233040),
  ),
  //fontFamily: 'Jannah',
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(defaultColor),
  ),
);

ThemeData lightTheme = ThemeData(
  
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //backgroundColor: defaultColor,

      ),
  dividerTheme: const DividerThemeData(
    thickness: 1.5,
    color: AppColors.defaultColor,
  ),
  
  colorScheme:  const ColorScheme.light(primary: defaultColor),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: defaultColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme:  const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      //height: .
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
  ),
  fontFamily: 'Jannah',
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(defaultColor),
  ),
);
