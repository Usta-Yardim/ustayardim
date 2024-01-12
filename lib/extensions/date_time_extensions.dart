import 'package:flutter/material.dart';

extension DateExtensions on DateTime {
  bool isSameDay(DateTime dateTime) {
    return dateTime.year == year && dateTime.month == month && dateTime.day == day;
  }

  TimeOfDay toTimeOfDay(){
    return TimeOfDay(hour: hour, minute: minute);
  }

  DateTime copyWithTimeOfDay(TimeOfDay timeOfDay){
    return DateTime(year,month,day,timeOfDay.hour,timeOfDay.minute,0,0,0);
  }
}
