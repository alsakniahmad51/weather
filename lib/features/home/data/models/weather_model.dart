// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, overridden_fields, annotate_overrides
import 'package:weather/features/home/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  late double temp_c;
  late double h_temp_c;
  late double avg_temp_c;
  late double l_temp_c;
  late String State;
  late String cityname;
  late String date;
  late List<dynamic> hours;
  final String stateWeekly;
  WeatherModel({
    required this.stateWeekly,
    required this.date,
    required this.avg_temp_c,
    required this.temp_c,
    required this.hours,
    required this.h_temp_c,
    required this.l_temp_c,
    required this.State,
    required this.cityname,
  }) : super(
            stateWeekly: stateWeekly,
            date: date,
            avg_temp: avg_temp_c,
            currenttemp: temp_c,
            h_temp: h_temp_c,
            l_temp: l_temp_c,
            State: State,
            cityName: cityname,
            hours: hours);

  factory WeatherModel.fromjson(Map<String, dynamic> json, int index) {
    return WeatherModel(
      stateWeekly: json['forecast']['forecastday'][index]['day']['condition']
          ['text'],
      date: json['forecast']['forecastday'][index]['date'],
      avg_temp_c: json['forecast']['forecastday'][index]['day']['avgtemp_c'],
      temp_c: json['current']['temp_c'],
      h_temp_c: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
      l_temp_c: json['forecast']['forecastday'][index]['day']['mintemp_c'],
      State: json['current']['condition']['text'],
      cityname: json['location']['name'],
      hours: json['forecast']['forecastday'][index]['hour'],
    );
  }
}
