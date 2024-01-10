import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/models/repairman_model.dart';
import 'package:ustayardim/theme/theme.dart';

class RepairmanModalWidget extends StatelessWidget {
  const RepairmanModalWidget({super.key, required this.repairmanModel});

  final RepairmanModel repairmanModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))]),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      repairmanModel.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(repairmanModel.rate.toStringAsFixed(1))
                  ],
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.zero,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.green),
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.call_rounded,
                              size: 15,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${repairmanModel.phoneNumber}",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(onTap: () {}, child: Icon(Icons.star_border_rounded)),
              InkWell(onTap: () {}, child: Icon(Icons.bookmark_border_rounded)),
              InkWell(onTap: () {}, child: Icon(FontAwesomeIcons.share,size: 20,)),
            ],
          ),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
