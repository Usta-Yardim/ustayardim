import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustayardim/auth/auth_screen.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
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
        ChangeNotifierProvider<CategoriesHelper>(create: (_)=>CategoriesHelper()),
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
  void initState(){

    _startTimer();
    super.initState();

  }

  _startTimer(){
    Timer(const Duration(seconds: 3), () {

      NavigatorHelper.push(destination: AuthScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    padding = MediaQuery.of(context).padding;
    return const Scaffold(
      body: Center(
        child: Text("SPLASH")
      ),
    );
  }
}
