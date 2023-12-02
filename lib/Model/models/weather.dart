class Weather {
  int? _id;
  String? _main;
  String? _description;
  String? _icon;
  int? get id => _id;

  String? get main => _main;

  String? get description => _description;

  String? get icon => _icon;

  Weather.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _main = json["main"];
    _description = json["description"];
    _icon = json["icon"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
