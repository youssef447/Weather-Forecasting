import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/constants.dart';

import '../models/userLocation.dart';
import 'ILocationService.dart';

class LocationService implements ILocationService {
  @override
  Future<Position> getCurrentPosition() async {
  /*   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('please enable location services');
      
    } */

    ///Returns a [Future] indicating if the user allows the App to access the device's location.
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    //now i'm sure i got the permission
    //get location..returns LocationData object
    var currentLocation = await Geolocator.getCurrentPosition();

    return currentLocation;
  }

  @override
  Future<String> getAddress() async {
    try {
          var currentLocation = await getCurrentPosition();

      List<Placemark> placemark = await placemarkFromCoordinates(
        currentLocation.latitude,
        currentLocation.longitude,
      );
      String country = placemark[0].country!;

      String state = placemark[0].administrativeArea!;
      String city = state.split(" ")[0];
      //String street = placemark[0].street!;
      return '$city, $country';
    } catch (e) {
      print('a7a');
      return Future.value(myLocation);
    }
  }

  ///هيعمل تراك للوكيشن يعني
  Future<void> getUserLocation() async {
    //final res = await getCurrentPosition();
    Geolocator.getPositionStream().listen((event) {
      print('changgggggge');

      UserLocation(latitude: event.latitude, longitude: event.longitude);
    });
  }
}
