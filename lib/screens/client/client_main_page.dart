import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/banner_helper.dart';
import 'package:ustayardim/helpers/bottom_navigation_helper.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/helpers/user_helper.dart';
import 'package:ustayardim/models/banner_model.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/widgets/banner_model_widget.dart';
import 'package:ustayardim/widgets/category_model_widget.dart';

class ClientMainPage extends StatefulWidget {
  const ClientMainPage({super.key});

  @override
  State<ClientMainPage> createState() => _ClientMainPageState();
}

class _ClientMainPageState extends State<ClientMainPage> {

  @override
  void initState() {
    Provider.of<UserHelper>(context,listen: false).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Consumer<BottomNavigationHelper>(builder: (context, bottomNavigationHelper, child) {
        return BottomNavigationBar(
          currentIndex: bottomNavigationHelper.index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Image.asset("assets/images/logo.png",width: 25,color: bottomNavigationHelper.index == 0 ? Color(0xff393e41):Colors.grey.withOpacity(0.7),), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          onTap: (index) {
            bottomNavigationHelper.setIndex(index: index);
          },
        );
      }),
      body: Consumer<BottomNavigationHelper>(
        builder: (context, bottomNavigationHelper, child) {
          return bottomNavigationHelper.tabs[bottomNavigationHelper.index];
        },
      ),
    );
  }
}
