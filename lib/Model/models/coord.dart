class CoordClass {
    CoordClass({
        required this.lon,
        required this.lat,
    });

    double lon;
    double lat;

    factory CoordClass.fromJson(Map<String, dynamic> json) => CoordClass(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

