import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustayardim/auth/auth_screen.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/adress_helper.dart';
import 'package:ustayardim/helpers/banner_helper.dart';
import 'package:ustayardim/helpers/bottom_navigation_helper.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/screens/client/client_main_page.dart';
import 'package:ustayardim/theme/theme.dart';

void main() {
  runApp(const UstaYardim());
}

class UstaYardim extends StatelessWidget {
  const UstaYardim({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoriesHelper>(create: (_) => CategoriesHelper()),
        ChangeNotifierProvider<BannerHelper>(create: (_) => BannerHelper()),
        ChangeNotifierProvider<BottomNavigationHelper>(create: (_) => BottomNavigationHelper()),
        ChangeNotifierProvider<AdressHelper>(create: (_) => AdressHelper())
      ],
      child: MaterialApp(
        title: 'Usta Yardım',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: mainThemeData,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  _startTimer() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    token = pref.getString("token");

    Timer(const Duration(seconds: 3), () {
      if (token != null) {
        NavigatorHelper.push(destination: ClientMainPage());
      } else {
        NavigatorHelper.push(destination: AuthScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: width * 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width * 0.5,
              child: FittedBox(
                child: Text(
                  "Usta Yardım",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff393e41),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
