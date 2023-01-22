// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherLocation _$WeatherLocationFromJson(Map<String, dynamic> json) =>
    WeatherLocation(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      tz_id: json['tz_id'] as String,
      localtime_epoch: json['localtime_epoch'] as int,
      localtime: DateTime.parse(json['localtime'] as String),
    );

Map<String, dynamic> _$WeatherLocationToJson(WeatherLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'tz_id': instance.tz_id,
      'localtime_epoch': instance.localtime_epoch,
      'localtime': instance.localtime.toIso8601String(),
    };

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) =>
    WeatherCondition(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: json['code'] as int,
    );

Map<String, dynamic> _$WeatherConditionToJson(WeatherCondition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => WeatherInfo(
      last_updated_epoch: json['last_updated_epoch'] as int,
      last_updated: json['last_updated'] as String,
      temp_c: (json['temp_c'] as num).toDouble(),
      condition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
      wind_kph: (json['wind_kph'] as num).toDouble(),
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelslike_c: (json['feelslike_c'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.last_updated_epoch,
      'last_updated': instance.last_updated,
      'temp_c': instance.temp_c,
      'condition': instance.condition,
      'wind_kph': instance.wind_kph,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslike_c,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      current: WeatherInfo.fromJson(json['current'] as Map<String, dynamic>),
      location:
          WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'current': instance.current,
      'location': instance.location,
    };
