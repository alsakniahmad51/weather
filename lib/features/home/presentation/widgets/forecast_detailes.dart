// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather/core/constant/images_path.dart';
import 'package:weather/features/home/presentation/widgets/bottom_sheet_item.dart';

class ForecastDetailes extends StatelessWidget {
  const ForecastDetailes({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: itemBuilder,
    );
  }
}
