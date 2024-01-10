import 'package:flutter/material.dart';
import 'package:ustayardim/global/global.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("Galeri"),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                width: (width * 0.9 - 20) / 2,
                height: (width * 0.9 - 20) / 2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xff393e41))),
                child: Icon(Icons.add_photo_alternate_rounded,size: (width * 0.9 - 20) / 4,),
              ),
              SizedBox(width: 20,),
              Container(
                width: (width * 0.9 - 20) / 2,
                height: (width * 0.9 - 20) / 2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xff393e41))),
                child: Icon(Icons.add_photo_alternate_rounded,size: (width * 0.9 - 20) / 4,),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                width: (width * 0.9 - 20) / 2,
                height: (width * 0.9 - 20) / 2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xff393e41))),
                child: Icon(Icons.add_photo_alternate_rounded,size: (width * 0.9 - 20) / 4,),
              ),
              SizedBox(width: 20,),
              Container(
                width: (width * 0.9 - 20) / 2,
                height: (width * 0.9 - 20) / 2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xff393e41))),
                child: Icon(Icons.add_photo_alternate_rounded,size: (width * 0.9 - 20) / 4,),
              ),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){}, child: Text("Güncelle")),
        ],
      ),
    );
  }
}
