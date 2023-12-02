import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';
import 'package:weatherapp/Network/local/cach_helper.dart';
import 'package:weatherapp/constants.dart';

Widget defaultFormField(
    {required controller,
    required BuildContext context,
    bool isPassword = false,
    FocusNode? focusNode,
    TextInputType? type,
    bool? expand,
    String? helperText,
    Widget? label,
    bool readonly = false,
    bool filled = false,
    double radius = 0,
    IconData? prefix,
    IconData? suffix,
    Function()? onTap,
    Widget? prefixWidget,
    Widget? suffixWidget,
    String? labelText,
    bool? borderNone,
    String? Function(String?)? validate,
    Function(String)? onchanged,
    Function()? suffixPressed,
    String? hintText}) {
  return TextFormField(
    validator: validate,
    controller: controller,


    obscureText: isPassword,
    keyboardType: type,
    readOnly: readonly,
    onTap: onTap,
    onChanged: onchanged,
    minLines: expand != null ? null : 1,
    maxLines: expand != null ? null : 1,
    expands: expand != null ? true : false,
    //style of search text
    style: Theme.of(context).textTheme.subtitle1!,
    //onFieldSubmitted: ((value) => print(contoller.text)),
    focusNode: focusNode,

    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.subtitle1!,
      helperText: helperText,
      label: label,
      helperMaxLines: 2,

      labelStyle:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
      // focusColor: defaultColor,
      labelText: labelText,
      helperStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Colors.grey[400],
          ),

      /*  focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),),
         errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),), */

      filled: filled,

      fillColor: const Color(0xff21203e),
      prefixIcon: prefixWidget,

      prefixIconColor: Theme.of(context).iconTheme.color,

      suffixIcon: suffixWidget,

      /* IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffix,
          color: Colors.deepOrange,
        ),
      ), */
      //enabledBorder: InputBorder.,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            radius,
          )),
      border: UnderlineInputBorder(
          borderSide: borderNone != null ? BorderSide.none : const BorderSide(),
          borderRadius: BorderRadius.circular(
            radius,
          )),
    ),
  );
}
Widget defaultElevatedButton(
    {double elevation = 5,
    double? width,
    double? height,
    required String text,
    Color shadowColor = Colors.white,
    Color foregroundColor = Colors.white,
    Color backgroundColor = defaultColor,
    Function()? onPressed,
    double radius = 28.0}) {
  return ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(elevation),
      shadowColor: MaterialStateProperty.all<Color>(shadowColor),
      foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          //side: BorderSide(color: Colors.red),
        ),
      ),
      minimumSize: width != null && height != null
          ? MaterialStateProperty.all(
              Size(width, height),
            )
          : null,
      // backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
getAddress() async {
  var location = loc.Location();
  bool _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();

    if (!_serviceEnabled) {
      myLocation =
          await CacheHelper.getData(key: 'lastLocation') ?? myLocation;

      return;
    }
  }
  //now i'm sure i got the service
  //check if app has permission to access location permission ..returns permission status
  var _permission = await location.hasPermission();
  if (_permission == loc.PermissionStatus.denied) {
    _permission = await location.requestPermission();

    if (_permission != loc.PermissionStatus.granted) {
      myLocation =
          await CacheHelper.getData(key: 'lastLocation') ?? myLocation;

      return;
    }
  }

  //now i'm sure i got the permission
  //get location..returns LocationData object
  var currentLocation = await location.getLocation();
  List<Placemark> placemark = await placemarkFromCoordinates(
      currentLocation.latitude!, currentLocation.longitude!);
  String country = placemark[0].country!;
  String name = placemark[0].administrativeArea!.split(" ")[0];
  await CacheHelper.saveData(key: 'lastLocation', value: '$name, $country');
  //String street = placemark[0].street!;

  myLocation = "$name, $country";
}
