import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/components/city_cubit.dart';
import 'package:weather_forecast/model/city_response.dart';
import 'package:weather_forecast/view/home.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CityCubit>(
      create: (context) {
        return CityCubit(CityResponse());
      },
      child: const HomeScreen(),
    );
  }
}
