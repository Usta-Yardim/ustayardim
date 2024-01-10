import 'package:flutter/material.dart';
import 'package:ustayardim/global/global.dart';

class SnackBarHelper {
  static showSnackBar({required String content,required SnackBarType type}) {
    Color backgroundColor;

    switch(type){

      case SnackBarType.INFO:
        backgroundColor = Colors.orange;
        break;
      case SnackBarType.SUCCESS:
        backgroundColor = Colors.green;
        break;
      case SnackBarType.WARNING:
        backgroundColor = Colors.red;
        break;
    }

    ScaffoldMessenger.of(getContext()).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        content: Text(
          content,
          style: Theme.of(getContext())
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

enum SnackBarType { INFO, SUCCESS, WARNING }
