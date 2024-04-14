// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather/core/constant/images_path.dart';

class ForecastDetailes extends StatelessWidget {
  const ForecastDetailes({
    Key? key,
    required this.time,
    required this.temp,
    required this.image,
  }) : super(key: key);
  final String time;
  final int temp;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 40.h, left: 5.w, right: 0.w),
          child: Container(
            height: 200.h,
            width: 85.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 8.h),
                  child: Text(time),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 43.h),
                  child: Image.asset(
                    image,
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.w, top: 95.h),
                  child: Text(
                    "$temp°",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                Image.asset(
                  hourly,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
