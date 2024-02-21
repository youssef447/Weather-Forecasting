import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/userLocation.dart';
import 'ILocationService.dart';


class LocationService implements ILocationService {
  @override
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('please enable location services');
    }
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

  Future<List<String>> getAddress() async {
    var currentLocation = await getCurrentPosition();
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(
        currentLocation.latitude,
        currentLocation.longitude,
      );
      List<String> res = [];
      String country = placemark[0].country!;
      res.add(country);

      String state = placemark[0].administrativeArea!;
      res.add(state);
      String city = state.split(" ")[0];
      res.add(city);
      String street = placemark[0].street!;
      res.add(street);
      print("${res[3]}, ${res[2]} ${res[0]}");
      return res;
    } catch (e) {
      return Future.error(e);
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
