// ignore_for_file: non_constant_identifier_names, dead_code

import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';

class WeatherEntity {
  final double currenttemp;
  final double avg_temp;
  final double h_temp;
  final double l_temp;
  final String State;
  final String cityName;
  final List<dynamic> hours;
  final String date;
  final String stateWeekly;

  WeatherEntity(
      {required this.stateWeekly,
      required this.date,
      required this.avg_temp,
      required this.hours,
      required this.currenttemp,
      required this.h_temp,
      required this.l_temp,
      required this.State,
      required this.cityName});

  String getImage(String state) {
    if (state == 'Sunny' || state == 'Clear') {
      return 'assets/images/forcast/Animation - 1711928892500.gif';
    } else if (State == 'Blizzard' ||
        state == 'Patchy snow possible' ||
        state == 'Patchy light snow' ||
        state == 'light snow' ||
        state == 'Light snow' ||
        state == 'Patchy sleet possible' ||
        state == 'Patchy freezing drizzle possible' ||
        state == 'Blowing snow') {
      return 'assets/images/forcast/weather_snowy.gif';
    } else if (State == 'Freezing fog' ||
        state == 'Fog' ||
        state == 'Heavy Cloud' ||
        state == 'Mist' ||
        state == 'Partly Cloudy ' ||
        state == 'Cloudy ' ||
        state == 'Partly Cloudy' ||
        state == 'Partly cloudy' ||
        state == 'Overcast' ||
        state == 'overcast' ||
        state == 'partly cloudy' ||
        state == 'Fog') {
      return 'assets/images/forcast/cloudy.gif';
    } else if (State == 'Patchy rain possible' ||
        state == 'Patchy rain nearby' ||
        state == 'Heavy Rain' ||
        state == 'Patchy light drizzle' ||
        state == 'light drizzle' ||
        state == 'Light drizzle' ||
        state == 'Showers  ') {
      return 'assets/images/forcast/weather_rainy.gif';
    } else if (state == 'Thundery outbreaks possible' ||
        state == 'Moderate or heavy snow with thunder' ||
        state == 'Patchy light snow with thunder' ||
        state == 'Moderate or heavy rain with thunder' ||
        state == 'Light rain shower' ||
        state == 'Patchy light rain with thunder') {
      return 'assets/images/forcast/hello.gif';
    } else {
      return 'assets/images/forcast/Animation - 1711928892500.gif';
    }
  }

  String getDayOfWeek(int index, WeatherState state) {
    int year;
    int month;
    int day;
    late DateTime datetime;

    if (state is WeatherSuccess) {
      year = int.parse(state.weather[index].date.toString().split("-")[0]);
      month = int.parse(state.weather[index].date.toString().split("-")[1]);
      day = int.parse(state.weather[index].date.toString().split("-")[2]);
      datetime = DateTime(year, month, day);
    }
    switch (datetime.weekday) {
      case 1:
        return "MON";
        break;
      case 2:
        return "TUE";
        break;
      case 3:
        return "WED";
        break;
      case 4:
        return "THU";
        break;
      case 5:
        return "FRI";
        break;
      case 6:
        return "SAT";
        break;
      case 7:
        return "SAN";
        break;
    }
    return "UnKnown";
  }
}
