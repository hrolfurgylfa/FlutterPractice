// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      current: json['current'] as Map<String, dynamic>,
      location: json['location'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'current': instance.current,
      'location': instance.location,
    };
