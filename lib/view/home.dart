import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/components/city_cubit.dart';
import 'package:weather_forecast/components/city_response_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    CityCubit cityCubit = context.read<CityCubit>();
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        color: Colors.blueAccent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/cloud.png',
                      width: 120,
                    ),
                    Image.asset(
                      'lib/assets/sun.png',
                      width: 120,
                    ),
                    Image.asset(
                      'lib/assets/cloud.png',
                      width: 120,
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  'Weather Forecast',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 26),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Write a city name',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2)),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        cityCubit.cityName = textController.text;
                        context.read<CityCubit>().start();
                      },
                      child: const Text('Search'),
                    ),
                    BlocBuilder<CityCubit, CityResponseState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: state.isLoaded,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              height: 200,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.blue[800],
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 0.3,
                                      offset: Offset(0.2, 0.5)),
                                ],
                              ),
                              child: BlocBuilder<CityCubit, CityResponseState>(
                                  builder: (context, snapshot) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            height: 80,
                                            child: Image.network(snapshot.icon),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        snapshot.cityName,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Temp: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    Text(
                                                      '${snapshot.temperature}°',
                                                      style: TextStyle(
                                                          fontFamily: 'Anton',
                                                          fontSize: 32,
                                                          color: _getColor(
                                                              snapshot.color)),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        'Local Time: ${snapshot.formattedDate}'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(TempColor color) {
    switch (color) {
      case TempColor.red:
        return Colors.red;

      case TempColor.green:
        return Colors.green;

      case TempColor.white:
        return Colors.white;
    }
  }
}
