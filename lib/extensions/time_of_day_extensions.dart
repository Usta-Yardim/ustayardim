import 'package:flutter/material.dart';

extension TimeOfDayExtensions on TimeOfDay {
  DateTime toDateTime() {
    return DateTime.now().copyWith(
      hour: hour,
      minute: minute,
      millisecond: 0,
      microsecond: 0,
      second: 0,
    );
  }
}
