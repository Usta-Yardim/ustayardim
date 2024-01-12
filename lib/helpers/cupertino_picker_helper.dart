import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustayardim/extensions/date_time_extensions.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';

class CupertinoPickerHelper {
  static Future<double?> showCupertinoDoubleValuePicker(
      {required double min, required double max, required String unitShort}) async {
    int? integerPart = min.toInt();
    double? fractinalPart = 0;
    double? value;
    await showCupertinoModalPopup(
        context: getContext(),
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        value = null;
                        NavigatorHelper.pop();
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("İptal Et"),
                    ),
                    TextButton(
                        onPressed: () {
                          value = integerPart! + fractinalPart!;
                          NavigatorHelper.pop();
                        },
                        child: const Text("Tamam"))
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (v) {
                            integerPart = v + min.toInt();
                          },
                          children: List.generate(
                            (max - min).toInt(),
                            (index) => Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: Text((min + index).toStringAsFixed(0))),
                          ),
                        ),
                      ),
                      Text(
                        ",",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (v) {
                            fractinalPart = v * 0.1;
                          },
                          children: List.generate(
                            10,
                            (index) => Text(index.toString()),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });

    return value;
  }

  static Future<int?> showCupertinoIntegerValuePicker(
      {required double min, required double max, required String unitShort}) async {
    int? integerPart = min.toInt();
    int? value;
    await showCupertinoModalPopup(
        context: getContext(),
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        value = null;
                        NavigatorHelper.pop();
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("İptal Et"),
                    ),
                    TextButton(
                        onPressed: () {
                          value = integerPart!;
                          NavigatorHelper.pop();
                        },
                        child: const Text("Tamam"))
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (v) {
                            integerPart = v + min.toInt();
                          },
                          children: List.generate(
                            (max - min).toInt(),
                            (index) => Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: Text((min + index).toStringAsFixed(0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });

    return value;
  }

  static Future<DateTime?> showCupertinoDatePicker(
      {DateTime? minDate, bool shouldRestrictMaxDate = true}) async {
    DateTime now = DateTime.now();
    DateTime? dateTime;
    await showCupertinoModalPopup(
        context: getContext(),
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        dateTime = null;
                        NavigatorHelper.pop();
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("İptal Et"),
                    ),
                    TextButton(
                        onPressed: () {
                          NavigatorHelper.pop();
                        },
                        child: const Text("Tamam"))
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    dateOrder: DatePickerDateOrder.dmy,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: now,
                    minimumDate: minDate ?? now.subtract(const Duration(days: 100 * 366)),
                    maximumDate:
                        shouldRestrictMaxDate ? now : now.add(const Duration(days: 366 * 5)),
                    onDateTimeChanged: (date) {
                      dateTime = date;
                    },
                  ),
                ),
              ],
            ),
          );
        });

    return dateTime;
  }

  static Future<DateTime?> showCupertinoDateTimePicker(
      {DateTime? minDate, bool shouldRestrictMaxDate = true, DateTime? maxDate}) async {
    DateTime now = DateTime.now();
    DateTime? dateTime;
    await showCupertinoModalPopup(
        context: getContext(),
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        dateTime = null;
                        NavigatorHelper.pop();
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("İptal Et"),
                    ),
                    TextButton(
                        onPressed: () {
                          NavigatorHelper.pop();
                        },
                        child: const Text("Tamam"))
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    dateOrder: DatePickerDateOrder.dmy,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: shouldRestrictMaxDate
                        ? (maxDate ?? now)
                        : now,
                    minimumDate: minDate ?? now.subtract(const Duration(days: 5 * 366)),
                    maximumDate: shouldRestrictMaxDate
                        ? (maxDate ?? now)
                        : now.add(const Duration(days: 366 * 5)),
                    onDateTimeChanged: (date) {
                      dateTime = date;
                    },
                  ),
                ),
              ],
            ),
          );
        });

    return dateTime;
  }

  static Future<TimeOfDay?> showCupertinoTimeOfDayPicker(
      {bool shouldRestrictMaxTimeOfDay = true}) async {
    DateTime now = DateTime.now();
    DateTime? dateTime;
    await showCupertinoModalPopup(
        context: getContext(),
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        dateTime = null;
                        NavigatorHelper.pop();
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("İptal Et"),
                    ),
                    TextButton(
                        onPressed: () {
                          NavigatorHelper.pop();
                        },
                        child: const Text("Tamam"))
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: now,
                    minimumDate: now.subtract(const Duration(days: 5 * 366)),
                    maximumDate: shouldRestrictMaxTimeOfDay ? now : null,
                    onDateTimeChanged: (date) {
                      dateTime = date;
                    },
                  ),
                ),
              ],
            ),
          );
        });

    return dateTime?.toTimeOfDay();
  }

  static Future<int?> showCupertinoDurationPickerHour() async {
    int? integerPart = 0;
    int? fractinalPart = 0;
    int? value;
    await showCupertinoModalPopup(
        context: getContext(),
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        value = null;
                        NavigatorHelper.pop();
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("İptal Et"),
                    ),
                    TextButton(
                        onPressed: () {
                          value = integerPart! * 60 + fractinalPart!;
                          NavigatorHelper.pop();
                        },
                        child: const Text("Tamam"))
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (v) {
                            integerPart = v;
                          },
                          children: List.generate(
                            60,
                            (index) => Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: Text("${index < 10 ? "0$index" : index}")),
                          ),
                        ),
                      ),
                      Text(
                        ":",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (v) {
                            fractinalPart = v;
                          },
                          children: List.generate(
                            60,
                            (index) => Text("${index < 10 ? "0$index" : index}"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });

    return value;
  }

  static Future<int?> showCupertinoDurationPickerMinutes() async {
    int? integerPart = 0;
    int? fractinalPart = 0;
    int? value;
    await showCupertinoModalPopup(
        context: getContext(),
        builder: (context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        value = null;
                        NavigatorHelper.pop();
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("İptal Et"),
                    ),
                    TextButton(
                        onPressed: () {
                          value = integerPart! * 60 + fractinalPart!;
                          value = value! * 1000;
                          NavigatorHelper.pop();
                        },
                        child: const Text("Tamam"))
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (v) {
                            integerPart = v;
                          },
                          children: List.generate(
                            60,
                                (index) => Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: Text("${index < 10 ? "0$index" : index}")),
                          ),
                        ),
                      ),
                      Text(
                        ":",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (v) {
                            fractinalPart = v;
                          },
                          children: List.generate(
                            60,
                                (index) => Text("${index < 10 ? "0$index" : index}"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });

    return value;
  }
}
