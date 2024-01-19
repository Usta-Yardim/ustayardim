import 'package:flutter/material.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/helpers/snack_bar_helper.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();

  _update() async {
    if (newPasswordController.text != newPasswordAgainController.text) {
      SnackBarHelper.showSnackBar(
          content: "Yeni şifre tekrarı ile aynı olmalı.", type: SnackBarType.WARNING);
      return;
    }

    bool x = await Api.update(
        activePane: ActivePane.CHANGE_PASSWORD,
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text);

    if (x) {
      NavigatorHelper.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre Değiştir"),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Eski Şifre",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextField(
                controller: oldPasswordController,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Yeni Şifre",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextField(
                controller: newPasswordController,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Yeni Şifre Tekrar",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextField(
                controller: newPasswordAgainController,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: _update, child: Text("Şifre Değiştir"))
        ],
      ),
    );
  }
}
