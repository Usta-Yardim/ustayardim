import 'package:flutter/material.dart';
import 'package:ustayardim/global/global.dart';

///Bu helper kullanılarak context e ihtiyaç duyulmadan sayfalar arası geçiş yapılabilir


class NavigatorHelper {
  ///NavigatorHelper.push(destination: DestinationWidget()); şeklinde kullanılabilir.
  static Future<void> push({required Widget destination}) async {
    await Navigator.push(navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (c) => destination));
  }

  ///NavigatorHelper.pushAndRemoveUntil(destination: DestinationWidget()); şeklinde kullanılabilir.
  static Future<void> pushAndRemoveUntil({required Widget destination}) async {
    await Navigator.pushAndRemoveUntil(navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (c) => destination), (route) => false);
  }

  ///NavigatorHelper.pop(); şeklinde kullanılabilir.
  static pop(){
    Navigator.pop(navigatorKey.currentState!.context);
  }

  ///NavigatorHelper.pushReplacement(destination: DestinationWidget()); şeklinde kullanılabilir.
  static Future<void> pushReplacement({required Widget destination}) async{
    await Navigator.pushReplacement(navigatorKey.currentState!.context, MaterialPageRoute(builder: (c)=>destination));
  }
}
