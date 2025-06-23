import 'package:flutter/material.dart';

class AppointmentCardDataModel {
  final String? title;
  final String? subTitle;
  final num? appointmentCount;
  final String? iconPath;
  final Color? cardColor;
  final bool? showMoreButton;
  final num? appointmentChangePercent;

  AppointmentCardDataModel({
    this.title,
    this.subTitle,
    this.appointmentCount,
    this.iconPath,
    this.cardColor,
    this.showMoreButton,
    this.appointmentChangePercent,
  });
}
