import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_device_features/utils/CamUtils.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage = null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton(
            child: Text('Take Picture'),
            onPressed: () =>
                CamUtils.openSelector(context, _processSelectedImage),
          ),
        ),
      ],
    );
  }

  void _processSelectedImage(File? img) async {
    if (img == null) {
      return;
    }
    setState(() {
      _storedImage = img;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(img.path);
    final savedImage = await img.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }
}
