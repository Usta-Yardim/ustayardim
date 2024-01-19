
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustayardim/helpers/adress_helper.dart';
import 'package:ustayardim/helpers/bottom_navigation_helper.dart';
import 'package:ustayardim/helpers/user_helper.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    Provider.of<UserHelper>(context,listen: false).getUser();
    Provider.of<AdressHelper>(context, listen: false);
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
