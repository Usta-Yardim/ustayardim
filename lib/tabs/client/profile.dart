import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/screens/client/change_password_screen.dart';
import 'package:ustayardim/screens/client/edit_profile_screen.dart';
import 'package:ustayardim/screens/client/gallery_screen.dart';
import 'package:ustayardim/screens/client/help_screen.dart';
import 'package:ustayardim/screens/client/personal_informations_screen.dart';
import 'package:ustayardim/screens/client/sss_screen.dart';

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
        CircleAvatar(
          radius: width * 0.25,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
            child: Text(
          "Ebubekir Alp Elvan",
          style: Theme.of(context).textTheme.titleLarge,
        )),
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
            onTap: () {},
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
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.facebook)),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.twitter)),
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.linkedin))
          ],
        ),
      ],
    ));
  }
}
