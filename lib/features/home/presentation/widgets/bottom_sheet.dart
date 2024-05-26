// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather/core/constant/strings.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/widgets/bottom_sheet_item.dart';
import 'package:weather/features/home/presentation/widgets/forecast_detailes.dart';

Future<dynamic> bottomSheet(BuildContext context, TabController tabController) {
  return showMaterialModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
    ),
    clipBehavior: Clip.hardEdge,
    backgroundColor: const Color(0xff454265).withAlpha(190),
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bottom_sheet1.png'),
          ),
        ),
        height: 286.h,
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
                  child: Text(
                    "Hourly Forecast",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xffEBEBF5).withOpacity(60 / 100),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
                  child: Text(
                    "Weekly Forecast",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xffEBEBF5).withOpacity(60 / 100),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 245.h,
              width: AppSize.width.w,
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return TabBarView(
                      controller: tabController,
                      children: [
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: ForecastDetailes(
                              itemCount: 24,
                              itemBuilder: (context, index) {
                                return BottomSheetItem(
                                    time:
                                        "${state.weather[0].hours[index]['time'].toString().split(" ")[1]}",
                                    image: state.weather[0].getImage(state
                                        .weather[0]
                                        .hours[index]['condition']['text']),
                                    temp:
                                        "${state.weather[0].hours[index]['temp_c'].toString().split(".")[0]}");
                              },
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: ForecastDetailes(
                              itemCount: state.weather.length,
                              itemBuilder: (context, index) {
                                return BottomSheetItem(
                                    time:
                                        " ${state.weather[index].getDayOfWeek(index, state)} ",
                                    image: state.weather[index].getImage(
                                        state.weather[index].stateWeekly),
                                    temp:
                                        "${state.weather[index].avg_temp.toString().split(".")[0]}");
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  } else
                    return Text("data");
                },
              ),
            )
          ],
        ),
      ),
    ),
  );
}
