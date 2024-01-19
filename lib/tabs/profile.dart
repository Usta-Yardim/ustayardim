import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ustayardim/auth/auth_screen.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/helpers/user_helper.dart';
import 'package:ustayardim/screens/change_password_screen.dart';
import 'package:ustayardim/screens/edit_profile_screen.dart';
import 'package:ustayardim/screens/gallery_screen.dart';
import 'package:ustayardim/screens/help_screen.dart';
import 'package:ustayardim/screens/personal_informations_screen.dart';
import 'package:ustayardim/screens/sss_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Consumer<UserHelper>(builder: (context, userHelper, child) {
          return userHelper.userModel == null
              ? Container()
              : Column(
                  children: [
                    CircleAvatar(
                      radius: width * 0.25,
                      backgroundImage: userHelper.userModel!.profileImageUrl == null
                          ? null
                          : Image.network(userHelper.userModel!.profileImageUrl!).image,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      userHelper.userModel!.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                  ],
                );
        }),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 1))
              ]),
          child: ListTile(
            onTap: () {
              NavigatorHelper.push(destination: EditProfileScreen());
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Icon(Icons.edit),
            title: Text("Profili düzenle"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 1))
              ]),
          child: ListTile(
            onTap: () {
              NavigatorHelper.push(destination: PersonalInformationsScreen());
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Icon(Icons.person_rounded),
            title: Text("Kişisel Bilgiler"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 1))
              ]),
          child: ListTile(
            onTap: () {
              NavigatorHelper.push(destination: ChangePasswordScreen());
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Icon(Icons.password),
            title: Text("Şifre Değişikliği"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Consumer<UserHelper>(builder: (context, userHelper, child) {
          return userHelper.userModel!.userType == UserType.CLIENT
              ? Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(2, 1))
                          ]),
                      child: ListTile(
                        onTap: () {},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        leading: Icon(Icons.bookmark_add_rounded),
                        title: Text("Favori Ustalar"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(2, 1))
                          ]),
                      child: ListTile(
                        onTap: () {
                          NavigatorHelper.push(destination: GalleryScreen());
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        leading: Icon(Icons.photo),
                        title: Text("Galeri"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
        }),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 1))
              ]),
          child: ListTile(
            onTap: () {
              NavigatorHelper.push(destination: HelpScreen());
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Icon(Icons.help_rounded),
            title: Text("Yardım ve Destek"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 1))
              ]),
          child: ListTile(
            onTap: () {
              NavigatorHelper.push(destination: SSSScrean());
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Icon(Icons.help_rounded),
            title: Text("S.S.S"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffff4646),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 1))
              ]),
          child: ListTile(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.remove("token");
              prefs.remove("userId");
              prefs.remove("userType");
              token = null;
              userId = null;
              userType = null;

              NavigatorHelper.pushAndRemoveUntil(destination: AuthScreen());
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse("htttps://www.google.com"))) {
                    launchUrl(Uri.parse("htttps://www.google.com"));
                  } else {
                    print("dasdasdasdasdas");
                  }
                },
                icon: Icon(FontAwesomeIcons.instagram)),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.facebook)),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.twitter)),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.linkedin))
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
