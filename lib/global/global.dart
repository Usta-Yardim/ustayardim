import 'package:flutter/cupertino.dart';
import 'package:ustayardim/enums/enums.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late double width;
late double height;
late EdgeInsets padding;

String? token;
int? userId;
UserType? userType;

BuildContext getContext(){
  return navigatorKey.currentState!.context;
}

bool isValidPhoneNumber(String? value) =>
    RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)').hasMatch(value ?? '');