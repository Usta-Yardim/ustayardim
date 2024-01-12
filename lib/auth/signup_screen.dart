import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/screens/client/client_main_page.dart';
import 'package:ustayardim/theme/theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ValueNotifier<UserType> selectedUserType = ValueNotifier<UserType>(UserType.CLIENT);
  ValueNotifier<bool> obscureText = ValueNotifier(true);
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _register() async {
    bool valid = formKey.currentState!.validate();

    if (!valid)return;


    Api.register(name: nameController.text, mail: mailController.text, phone: phoneController.text, userType: selectedUserType.value, password: passwordController.text);
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: selectedUserType,
              builder: (context, selectedType, child) {
                return AnimatedCrossFade(
                    firstChild: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "Müşteri olarak kayıt ol.",
                          style: mainThemeData.primaryTextTheme.titleSmall,
                        )),
                    secondChild: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "Usta olarak kayıt ol.",
                          style: mainThemeData.primaryTextTheme.titleSmall,
                        )),
                    crossFadeState: selectedType == UserType.CLIENT
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 300));
              }),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Ad Soyad"),
            validator: (text)=>text == null || text.isEmpty ? "Adınızı giriniz.":null,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: mailController,
            decoration: InputDecoration(hintText: "Eposta adresi"),
            validator: (text)=>text == null || !EmailValidator.validate(text!) ? "Geçerli bir mail giriniz.":null,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "5** *** ** **"),
            validator: (text)=>isValidPhoneNumber(text == null ? null: "+90${text}") ? null:"Geçerli bir telefon numarası giriniz",
          ),
          SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
              valueListenable: obscureText,
              builder: (context, obscure, child) {
                return TextFormField(
                  controller: passwordController,
                  validator: (text)=>text == null || text.length < 6 ? "En az 6 karakter bir şifre giriniz.":null,
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
    );
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
                    _register();
                    //NavigatorHelper.push(destination: ClientMainPage());
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(width * 0.9, 60)),
                  child: Text(
                    "Kayıt Ol",
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
                    NavigatorHelper.pop();
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(width * 0.9, 60)),
                  child: Text(
                    "Giriş Yap",
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
