// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
