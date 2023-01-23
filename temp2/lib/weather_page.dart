import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp2/weather_state.dart';

class WeatherPage extends ConsumerWidget {
  final _cityController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, widget) {
              final weather = ref.watch(weatherData);
              return weather.when(
                loading: () {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text("Loading"),
                  //   ),
                  // );
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text("Something went wrong: $error\n$stackTrace"),
                ),
                data: (data) {
                  if (data == null) {
                    return const Text("Location not found.");
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Image.network(
                                "https:${data.current.condition.icon}"),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              data.location.name,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${data.current.temp_c}°C",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        hintText: "Enter city name",
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          ref.read(weatherLocation.notifier).setLocation(value);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          "Get Weather",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_cityController.text.isNotEmpty) {
                            ref
                                .read(weatherLocation.notifier)
                                .setLocation(_cityController.text);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
