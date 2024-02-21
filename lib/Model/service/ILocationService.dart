import 'package:geolocator/geolocator.dart';

abstract class ILocationService {

  Future<String> getAddress() ;
  Future<Position> getCurrentPosition();
}