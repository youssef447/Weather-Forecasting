class Wind {
  double? _speed;
  int? _deg;
  double? _gust;
  double? get speed => _speed;

  int? get deg => _deg;

  double? get gust => _gust;

  Wind.fromJson(Map<String, dynamic> json) {
    _speed = json["speed"]?.toDouble();
    _deg = json["deg"];
    _gust = json["gust"]?.toDouble();
  }

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
