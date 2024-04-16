// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather/core/constant/images_path.dart';
import 'package:weather/features/home/presentation/widgets/bottom_sheet_item.dart';

class ForecastDetailes extends StatelessWidget {
  const ForecastDetailes({
    Key? key,
    required this.time,
    required this.temp,
    required this.image,
  }) : super(key: key);
  final String time;
  final String temp;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 24,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return BottomSheetItem(time: time, image: image, temp: temp);
      },
    );
  }
}
