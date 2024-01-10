import 'package:flutter/material.dart';
import 'package:ustayardim/global/global.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
          SizedBox(height: 20,),
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
              TextField(),
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
              TextField(),
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
              TextField(),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: (){}, child: Text("Şifre Değiştir"))
        ],
      ),
    );
  }
}
