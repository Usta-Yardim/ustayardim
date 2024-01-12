import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ustayardim/global/global.dart';

class PickerHelper {
  static Future<File?> _pickImage({required ImageSource source}) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? xFile = await imagePicker.pickImage(source: source);


    File? file;

    if (xFile!.path.contains(".jpg")) {
      xFile =await FlutterImageCompress.compressAndGetFile(
          xFile.path, xFile.path.replaceAll(".jpg", "1.jpg"),
          quality: 50);
      file = File(xFile!.path);
    } else if (xFile.path.contains(".jpeg")) {
      xFile = await FlutterImageCompress.compressAndGetFile(
          xFile.path, xFile.path.replaceAll(".jpeg", "1.jpeg"),
          quality: 50);
      file = File(xFile!.path);
    } else {
      file = File(xFile.path);
    }


    return file;
  }

  static Future<File?> pickImage() async{
    File? file;

    await showModalBottomSheet(context: getContext(), builder: (context){
        return Container(
          height: 120,
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                "Bir fotoğraf seçiniz.",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                        foregroundColor: MaterialStateProperty.all(Colors.black)),
                    onPressed: () async{
                      file =await _pickImage(source: ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera_alt),
                        Text(
                          "Kamera",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                            foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                        onPressed: () async{
                          file = await _pickImage(source: ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.image),
                            Text(
                              "Galeri",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        );
    });

    return file;
  }
}