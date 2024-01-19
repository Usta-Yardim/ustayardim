import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/auth/signup_screen.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/screens/main_page.dart';
import 'package:ustayardim/theme/theme.dart';
import 'package:http/http.dart' as http;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ValueNotifier<UserType> selectedUserType = ValueNotifier<UserType>(UserType.CLIENT);
  ValueNotifier<bool> obscureText = ValueNotifier(true);
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _register() async {
    final response = await http.post(Uri.parse("http://localhost:5120/api/Users/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "fullname": "dsdasdsadas",
          "email": mailController.text,
          "phoneNumber": "05510786543",
          "userType": selectedUserType.value == UserType.CLIENT ? "musteri" : "usta",
          "password": passwordController.text,
        }));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString("token", json["token"]);
      prefs.setInt("userId", json["userId"]);


      token = json["token"];

      NavigatorHelper.push(destination: MainPage());

      print("ok");
      print(json["token"]);
    } else {
      print(response.body);
      print(response.statusCode);
    }
  }

  _login() {
    Api.login(mail: mailController.text, password: passwordController.text, loginUserType: selectedUserType.value);
  }

  Widget _buildSelectUserTypeWidget() {
    return Container(
      width: width * 0.9,
      height: 50,
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xffFFCF8A)),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    selectedUserType.value = UserType.CLIENT;
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Center(
                    child: Text(
                      "Müşteri",
                      style: mainThemeData.primaryTextTheme.titleSmall,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    selectedUserType.value = UserType.MECHANIC;
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Center(
                    child: Text(
                      "Usta",
                      style: mainThemeData.primaryTextTheme.titleSmall,
                    ),
                  ),
                ),
              )
            ],
          ),
          ValueListenableBuilder(
              valueListenable: selectedUserType,
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: value == UserType.CLIENT ? 0 : width * 0.45,
                  child: Container(
                    width: width * 0.45 - 16,
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.brown.withOpacity(0.4),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return ValueListenableBuilder(
        valueListenable: selectedUserType,
        builder: (context, selectedType, child) {
          return AnimatedCrossFade(
              firstChild: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "Müşteri olarak giriş yap.",
                        style: mainThemeData.primaryTextTheme.titleSmall,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(hintText: "Eposta adresi"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                      valueListenable: obscureText,
                      builder: (context, obscure, child) {
                        return TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              hintText: "Şifre",
                              suffixIcon: InkWell(
                                onTap: () {
                                  obscureText.value = !obscureText.value;
                                },
                                child: Icon(!obscure ? Icons.visibility : Icons.visibility_off),
                              )),
                          obscureText: obscure,
                        );
                      })
                ],
              ),
              secondChild: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "Usta olarak giriş yap.",
                        style: mainThemeData.primaryTextTheme.titleSmall,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(hintText: "Eposta adresi"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                      valueListenable: obscureText,
                      builder: (context, obscure, child) {
                        return TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              hintText: "Şifre",
                              suffixIcon: InkWell(
                                onTap: () {
                                  obscureText.value = !obscureText.value;
                                },
                                child: Icon(!obscure ? Icons.visibility : Icons.visibility_off),
                              )),
                          obscureText: obscure,
                        );
                      })
                ],
              ),
              crossFadeState: selectedType == UserType.CLIENT
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 300));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: width * 0.9,
            child: ListView(
              children: [
                Text(
                  "Usta Yardım'a\nHoş Geldiniz!",
                  style: mainThemeData.primaryTextTheme.titleLarge!.copyWith(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                _buildSelectUserTypeWidget(),
                SizedBox(
                  height: 20,
                ),
                _buildForm(),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    _login();
                    //NavigatorHelper.push(destination: ClientMainPage());
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(width * 0.9, 60)),
                  child: Text(
                    "Giriş Yap",
                    style:
                        mainThemeData.primaryTextTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      endIndent: 20,
                    )),
                    Text(
                      "veya",
                      style: mainThemeData.primaryTextTheme.titleSmall,
                    ),
                    Expanded(
                        child: Divider(
                      indent: 20,
                    ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: (){
                    NavigatorHelper.push(destination: SignupScreen());
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(width * 0.9, 60)),
                  child: Text(
                    "Kayıt Ol",
                    style:
                        mainThemeData.primaryTextTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
