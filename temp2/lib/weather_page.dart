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
        children: [
          TextFormField(
            controller: _cityController,
            decoration: const InputDecoration(
              hintText: "Enter city name",
              border: OutlineInputBorder(),
            ),
          ),
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
                  error: (a, b) => Center(
                        child: Text("Something went wrong: ${weather.error}"),
                      ),
                  data: (data) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.sunny,
                                  size: 64,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  data.location["name"],
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  (data.current["temp_c"] as double).toString(),
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
                      ));
            },
          ),
          ElevatedButton(
            child: const Text("Get Weather"),
            onPressed: () {
              // if (_cityController.text.isNotEmpty) {
              ref.read(weatherLocation.notifier).setLocation(_cityController.text);
            },
          ),
        ],
      ),
    );
  }
}
