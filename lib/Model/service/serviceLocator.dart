import 'package:get_it/get_it.dart';
import 'package:weatherapp/Model/service/dbService.dart';

final getIt=GetIt.instance;
serviceLocatorInit(){

  getIt.registerLazySingleton(()=>DbHealper());
}