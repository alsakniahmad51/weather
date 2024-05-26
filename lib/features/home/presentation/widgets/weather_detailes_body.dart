import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/presentation/widgets/detailes_page_background.dart';
import 'package:weather/features/home/presentation/widgets/house_image.dart';
import 'package:weather/features/home/presentation/widgets/navigation_bar.dart';
import 'package:weather/features/home/presentation/widgets/rectangle_image.dart';

import '../../../../core/constant/strings.dart';

class WeatherDetailesBody extends StatelessWidget {
  const WeatherDetailesBody({
    super.key,
    required this.data,
  });

  final WeatherEntity data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: AppSize.hight.h,
        width: AppSize.width.w,
        decoration: detailesPageBackground(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    data.cityName,
                    style:
                        TextStyle(fontSize: 38.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  "${data.currenttemp.toInt()}°",
                  style:
                      TextStyle(fontSize: 96.sp, fontWeight: FontWeight.w400),
                ),
                Text(
                  data.State,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffEBEBF5).withOpacity(60 / 100)),
                ),
                Text(
                  "H:${data.h_temp.toInt()}°   L:${data.l_temp.toInt()}°",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                const RectangleImage(),
                const HouseImage(),
                Container(
                  height: 100.h,
                  decoration: const BoxDecoration(
                    color: Color(0xff31295b),
                  ),
                ),
                const CustomNavigationBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
