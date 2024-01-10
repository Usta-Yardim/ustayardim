import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late double width;
late double height;
late EdgeInsets padding;

String? token;

BuildContext getContext(){
  return navigatorKey.currentState!.context;
}