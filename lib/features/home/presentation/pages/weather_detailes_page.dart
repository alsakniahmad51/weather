// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/widgets/weather_detailes_body.dart';

class WeatherDetailesPage extends StatelessWidget {
  const WeatherDetailesPage({
    super.key,
    required this.data,
  });
  final WeatherEntity data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          body: WeatherDetailesBody(data: data),
        );
      },
    );
  }
}
