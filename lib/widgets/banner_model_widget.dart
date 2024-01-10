import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/models/banner_model.dart';
import 'package:ustayardim/theme/theme.dart';

class BannerModelWidget extends StatelessWidget {
  const BannerModelWidget({super.key, required this.bannerModel});

  final BannerModel bannerModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: width*0.9 * 16/9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              bannerModel.photoUrl,
              fit: BoxFit.fitHeight,
              width: width * 0.9,
              height: width*0.9 * 16/9,
            ),
            Positioned(
                right: 10,
                bottom: 5,
                child: Text(
                  bannerModel.title,
                  style: mainThemeData.textTheme.titleLarge!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
