// ignore_for_file: non_constant_identifier_names

class WeatherEntity {
  final double temp;
  final double h_temp;
  final double l_temp;
  final String State;
  final String cityName;
  final List<dynamic> hours;

  WeatherEntity(
      {required this.hours,
      required this.temp,
      required this.h_temp,
      required this.l_temp,
      required this.State,
      required this.cityName});

  String getImage() {
    if (State == 'Sunny' || State == 'Clear' || State == 'partly cloudy') {
      return 'assets/images/forcast/Animation - 1711928892500.gif';
    } else if (State == 'Blizzard' ||
        State == 'Patchy snow possible' ||
        State == 'Patchy light snow' ||
        State == 'light snow' ||
        State == 'Light snow' ||
        State == 'Patchy sleet possible' ||
        State == 'Patchy freezing drizzle possible' ||
        State == 'Blowing snow') {
      return 'assets/images/forcast/weather_snowy.gif';
    } else if (State == 'Freezing fog' ||
        State == 'Fog' ||
        State == 'Heavy Cloud' ||
        State == 'Mist' ||
        State == 'Partly Cloudy' ||
        State == 'Partly cloudy' ||
        State == 'Overcast' ||
        State == 'overcast' ||
        State == 'Fog') {
      return 'assets/images/forcast/cloudy.gif';
    } else if (State == 'Patchy rain possible' ||
        State == 'Patchy rain nearby' ||
        State == 'Heavy Rain' ||
        State == 'Patchy light drizzle' ||
        State == 'Showers  ') {
      return 'assets/images/forcast/weather_rainy.gif';
    } else if (State == 'Thundery outbreaks possible' ||
        State == 'Moderate or heavy snow with thunder' ||
        State == 'Patchy light snow with thunder' ||
        State == 'Moderate or heavy rain with thunder' ||
        State == 'Light rain shower' ||
        State == 'Patchy light rain with thunder') {
      return 'assets/images/forcast/hello.gif';
    } else {
      return 'assets/images/forcast/Animation - 1711928892500.gif';
    }
  }
}
