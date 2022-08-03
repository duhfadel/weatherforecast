import 'package:flutter/material.dart';
import 'package:weather_forecast/components/home_container.dart';
import 'package:weather_forecast/theme.dart';

void main() {
  runApp(
     MaterialApp(
      home: const HomeContainer(),
      theme: CustomTheme.lightTheme,
    ),
  );
}
