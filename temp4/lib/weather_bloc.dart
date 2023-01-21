import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:temp4/weather.dart';
import 'package:temp4/weather_repository.dart';

@immutable
abstract class WeatherEvent {}

class WeatherRequest extends WeatherEvent {
  final String cityName;

  WeatherRequest({required this.cityName});
}

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadInprogress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  WeatherLoadSuccess({required this.weather});
}

class WeatherLoadFailure extends WeatherState {
  final String error;
  WeatherLoadFailure({required this.error});
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = WeatherRepository();
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherRequest>((event, emit) async {
      emit(WeatherLoadInprogress());

      try {
        final weatherResponse =
            await _weatherRepository.getWeather(event.cityName);
        emit(WeatherLoadSuccess(weather: weatherResponse));
      } catch (e) {
        emit(WeatherLoadFailure(error: e.toString()));
      }
    });
  }
}
