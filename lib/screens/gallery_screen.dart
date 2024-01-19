import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/helpers/picker_helper.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  ValueNotifier<File?> image1 = ValueNotifier(null);
  ValueNotifier<File?> image2 = ValueNotifier(null);
  ValueNotifier<File?> image3 = ValueNotifier(null);
  ValueNotifier<File?> image4 = ValueNotifier(null);

  _update() async {
    List<File> referanceImages = [];

    if (image1.value != null) {
      referanceImages.add(image1.value!);
    }

    if (image2.value != null) {
      referanceImages.add(image2.value!);
    }
    if (image3.value != null) {
      referanceImages.add(image3.value!);
    }
    if (image4.value != null) {
      referanceImages.add(image4.value!);
    }

    if (referanceImages.isNotEmpty) {
      bool x = await  Api.update(activePane: ActivePane.GALLERY, referanceImages: referanceImages);
      if (x){
        NavigatorHelper.pop();
      }

    }
  }

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
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  image1.value = await PickerHelper.pickImage();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: (width * 0.9 - 20) / 2,
                  height: (width * 0.9 - 20) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff393e41))),
                  child: ValueListenableBuilder(
                      valueListenable: image1,
                      builder: (context, imageFile, child) {
                        return imageFile != null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      imageFile,
                                      fit: BoxFit.cover,
                                      width: (width * 0.9 - 20) / 2,
                                      height: (width * 0.9 - 20) / 2,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          image1.value = null;
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ))
                                ],
                              )
                            : Icon(
                                Icons.add_photo_alternate_rounded,
                                size: (width * 0.9 - 20) / 4,
                              );
                      }),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  image2.value = await PickerHelper.pickImage();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: (width * 0.9 - 20) / 2,
                  height: (width * 0.9 - 20) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff393e41))),
                  child: ValueListenableBuilder(
                      valueListenable: image2,
                      builder: (context, imageFile, child) {
                        return imageFile != null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      imageFile,
                                      fit: BoxFit.cover,
                                      width: (width * 0.9 - 20) / 2,
                                      height: (width * 0.9 - 20) / 2,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          image2.value = null;
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ))
                                ],
                              )
                            : Icon(
                                Icons.add_photo_alternate_rounded,
                                size: (width * 0.9 - 20) / 4,
                              );
                      }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  image3.value = await PickerHelper.pickImage();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: (width * 0.9 - 20) / 2,
                  height: (width * 0.9 - 20) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff393e41))),
                  child: ValueListenableBuilder(
                      valueListenable: image3,
                      builder: (context, imageFile, child) {
                        return imageFile != null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      imageFile,
                                      fit: BoxFit.cover,
                                      width: (width * 0.9 - 20) / 2,
                                      height: (width * 0.9 - 20) / 2,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          image3.value = null;
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ))
                                ],
                              )
                            : Icon(
                                Icons.add_photo_alternate_rounded,
                                size: (width * 0.9 - 20) / 4,
                              );
                      }),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  image4.value = await PickerHelper.pickImage();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: (width * 0.9 - 20) / 2,
                  height: (width * 0.9 - 20) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff393e41))),
                  child: ValueListenableBuilder(
                      valueListenable: image4,
                      builder: (context, imageFile, child) {
                        return imageFile != null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      imageFile,
                                      fit: BoxFit.cover,
                                      width: (width * 0.9 - 20) / 2,
                                      height: (width * 0.9 - 20) / 2,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          image4.value = null;
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ))
                                ],
                              )
                            : Icon(
                                Icons.add_photo_alternate_rounded,
                                size: (width * 0.9 - 20) / 4,
                              );
                      }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: _update, child: Text("Güncelle")),
        ],
      ),
    );
  }
}
