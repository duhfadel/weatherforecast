import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/components/city_response_state.dart';
import 'package:weather_forecast/components/config.dart';
import 'package:weather_forecast/model/city_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CityCubit extends Cubit<CityResponseState> {
  CityResponse? cityResponse;

  CityCubit(this.cityResponse)
      : super(CityResponseState(
            isLoaded: false,
            color: TempColor.green,
            icon: '',
            formattedDate: '',
            temperature: 0.0,
            cityName: ''));

  Config config = Config();
  String formattedDate = '';
  double temperature = 0.0;
  String cityName = '';
  String iconUrl = '';

  

  Future<void> start() async {
    cityResponse = await search();
    if (cityResponse != null) {
      emit(
        CityResponseState(
          cityResponse: cityResponse,
          isLoaded: true,
          color: changeTempColor(cityResponse!),
          icon: showIcon(cityResponse!),
          formattedDate: showDate(cityResponse!),
          temperature: showTemperature(cityResponse!),
          cityName: showName(cityResponse!),
        ),
      );
    }
  }

  search() async {
    String id = config.id;
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$id&&units=metric';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      cityResponse = CityResponse.fromJson(map);
      return cityResponse;
    }
  }

  showDate(CityResponse cityResponse) {
    int date = (DateTime.now().millisecondsSinceEpoch);
    int currentTime = (date + (cityResponse.timezone! * 1000));
    formattedDate = DateFormat('dd-MM-yyyy HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(currentTime, isUtc: false));
    return formattedDate;
  }

  TempColor changeTempColor(CityResponse cityResponse) {
    if (cityResponse.main!.temp! <= 19.99) {
      return TempColor.white;
    }
    if (cityResponse.main!.temp! > 19.99 && cityResponse.main!.temp! < 29.00) {
      return TempColor.green;
    }
    return TempColor.red;
  }

  String showIcon(CityResponse cityResponse) {
    String icon = cityResponse.weather!.first.icon!;
    iconUrl = 'https://openweathermap.org/img/wn/$icon@2x.png';
    return iconUrl;
  }

  double showTemperature(CityResponse cityResponse) {
    temperature = cityResponse.main!.temp!;
    return temperature;
  }

  String showName(CityResponse cityResponse) {
    cityName = cityResponse.name!;
    return cityName;
  }
}
