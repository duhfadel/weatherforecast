import 'package:json_annotation/json_annotation.dart';


part 'city_response.g.dart';
@JsonSerializable()
class CityResponse {
  CityResponse({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name = 'city',
    this.cod,
  });

  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;

  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;
  factory CityResponse.fromJson(Map<String, dynamic> json) =>
      _$CityResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}
@JsonSerializable()
class Clouds {
  Clouds({
    this.all,
  });

  int? all;
  factory Clouds.fromJson(Map<String, dynamic> json) =>
      _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}
@JsonSerializable()
class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  double? lon;
  double? lat;
  factory Coord.fromJson(Map<String, dynamic> json) =>
      _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
@JsonSerializable()
class Main {
  Main({
    this.temp = 0,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  factory Main.fromJson(Map<String, dynamic> json) =>
      _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}
@JsonSerializable()
class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise = 0,
    this.sunset = 0,
  });

  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;
  factory Sys.fromJson(Map<String, dynamic> json) =>
      _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}
@JsonSerializable()
class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
