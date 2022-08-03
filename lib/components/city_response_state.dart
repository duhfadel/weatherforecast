import 'package:weather_forecast/model/city_response.dart';

class CityResponseState {
  bool isLoaded = false;
  CityResponse? cityResponse;
  TempColor color;
  String icon;
  String formattedDate;
  double temperature;
  String cityName;

  CityResponseState(
      {required this.isLoaded,
      this.cityResponse,
      required this.color,
      required this.icon,
      required this.formattedDate,
      required this.temperature,
      required this.cityName});
}

enum TempColor {
  red,
  green,
  white,
}
