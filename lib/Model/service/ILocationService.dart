import 'package:geolocator/geolocator.dart';

abstract class ILocationService {

  Future<List<String>> getAddress() ;
  Future<Position> getCurrentPosition();
}