import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class CamUtils {
  static ImagePicker picker = ImagePicker();

  static void openSelector(BuildContext cntxt, Function(File) callback) async {
    showModalBottomSheet(
        context: cntxt,
        builder: (context) {
          return SafeArea(
              child: Container(
                child: Wrap(
                  children: [
                    ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text("Launch Gallery"),
                      onTap: () async {
                        var result = await launchGallery(ImagePicker());
                        Navigator.of(context).pop();
                        callback(result);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.photo_camera),
                      title: Text("Launch Camera"),
                      onTap: () async {
                        var result = await launchCam(ImagePicker());
                        Navigator.of(context).pop();
                        callback(result);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  static Future launchGallery(ImagePicker picker) async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return File(image?.path ?? "");
  }

  static Future launchCam(ImagePicker picker) async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return File(image?.path ?? "");
  }
}
