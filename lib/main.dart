import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustayardim/auth/auth_screen.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/adress_helper.dart';
import 'package:ustayardim/helpers/banner_helper.dart';
import 'package:ustayardim/helpers/bottom_navigation_helper.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/helpers/user_helper.dart';
import 'package:ustayardim/screens/main_page.dart';
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
        ChangeNotifierProvider<AdressHelper>(create: (_) => AdressHelper()),
        ChangeNotifierProvider<UserHelper>(create: (_)=>UserHelper()),
      ],
      child: MaterialApp(
        title: 'Usta Yardım',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: mainThemeData,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('tr', 'TR'),
        ],
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
    userId = pref.getInt("userId");
    String? type = pref.getString("userType");
    if (type != null){
      userType = UserType.values.byName(type);
    }


    Timer(const Duration(seconds: 3), () {
      if (token != null) {
        NavigatorHelper.push(destination: MainPage());
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
