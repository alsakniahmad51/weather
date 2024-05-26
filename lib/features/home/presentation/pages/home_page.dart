// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as l;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/features/home/domain/entities/weather_entity.dart';
import 'package:weather/features/home/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather/features/home/presentation/widgets/home_body.dart';
import 'package:weather/features/home/presentation/widgets/home_page_appbar.dart';
import 'package:weather/features/home/presentation/widgets/list_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<WeatherEntity> data = [];
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.location_on,
          size: 45,
        ),
        onPressed: () async {
          l.Location location = l.Location();

          bool _serviceEnabled;
          l.PermissionStatus _permissionGranted;
          // ignore: unused_local_variable
          l.LocationData _locationData;

          _serviceEnabled = await location.serviceEnabled();
          if (!_serviceEnabled) {
            _serviceEnabled = await location.requestService();
            if (!_serviceEnabled) {
              return;
            }
          }

          _permissionGranted = await location.hasPermission();
          if (_permissionGranted == l.PermissionStatus.denied) {
            _permissionGranted = await location.requestPermission();
            if (_permissionGranted != l.PermissionStatus.granted) {
              return;
            }
          }

          _locationData = await location.getLocation();

          try {
            List<Placemark> placemarks = await placemarkFromCoordinates(
              _locationData.latitude!,
              _locationData.longitude!,
            );
            log(placemarks[0].locality.toString());
            log("\n\n/n/n/n/n/n/n/n/n/n/n ${placemarks[0].locality}");
            BlocProvider.of<WeatherCubit>(context)
                .getWeather(placemarks[0].locality!);
          } catch (err) {
            print(err.toString());
          }
        },
      ),
      // backgroundColor: const Color(0xff31305e).withOpacity(1),
      extendBodyBehindAppBar: true,
      appBar: homePageAppBar(),

      // backgroundColor: const Color(0xff2F3C50),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoading) {
            isLoading = true;
          } else if (state is WeatherSuccess || state is WeatherFailure) {
            isLoading = false;
          } else if (state is WeatherFailure) {
            log(state.errmessage);
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return ModalProgressHUD(

                // progressIndicator: Image.asset(
                //   'assets/images/Animation - 1711406527649.gif',
                //   color: const Color.fromARGB(255, 178, 126, 255),
                // ),
                opacity: 0,
                inAsyncCall: isLoading,
                child: const HomeBody(child: Text('')));
          } else if (state is WeatherSuccess) {
            data = state.weather;
            return HomeBody(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                children: [
                  Column(
                    children: [
                      Positioned(
                        child: SizedBox(
                          height: 710.h,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: (state.weather.length) ~/ 3,
                            itemBuilder: (context, index) {
                              return ListViewItem(
                                data: data,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else if (state is WeatherFailure) {
            return HomeBody(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!(state.errmessage == "Parameter q is missing."))
                      Column(
                        children: [
                          Image.asset(
                              height: 60.h,
                              width: 60.w,
                              'assets/images/error-icon-32.png'),
                          Text(state.errmessage),
                        ],
                      ),
                  ],
                ),
              ),
            );
          } else if (state is WeatherInitial) {
            return const HomeBody(child: Text(""));
          } else {
            return const Center(child: Text("unKnouwn Error"));
          }
        },
      ),
    );
  }
}

/*

return HomeBody(
            child: ListView(
              shrinkWrap: false,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, bottom: 0.h),
                      child: SizedBox(
                        height: 38.h,
                        width: 358.w,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              colors: [
                                Colors.black38,
                                Colors.transparent.withOpacity(0.15)
                              ],
                            ),
                          ),
                          child: customTextField(
                            weatherUseCase: WeatherUseCase(
                              HomeRepoImpl(
                                RemoteDataSourceImpl(
                                  ApiService(
                                    Dio(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: SizedBox(
                        height: 710.h,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const ListViewItem();
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );

 */
