import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart' as path;

class ImageInputWidget extends StatefulWidget {
  final Function? passFile;

  ImageInputWidget({required this.passFile});

  @override
  State<StatefulWidget> createState() {
    return ImageInputWidgetState();
  }
}

class ImageInputWidgetState extends State<ImageInputWidget> {
  File? _storedImage;
  XFile? image;
  XFile? photo;

  void _pickImageGallery() async {
/*     image = await ImagePicker().pickImage(source: ImageSource.gallery) as XFile; */
    photo = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      maxHeight: 600,
    ) as XFile;

    if (photo!.path.isNotEmpty) {
      setState(
        () {
          _storedImage = File(photo!.path);
        },
      );
      final appPath = await pathProvider.getApplicationDocumentsDirectory();
      final fileName = path.basename(_storedImage!.path);
      print("appPath::" + appPath.path + '/' + fileName);
      final image = await _storedImage!.copy('${appPath.path}/$fileName');
      widget.passFile!(image);
    }
  }

  Widget build(BuildContext contx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 150,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: _storedImage != null
              ? Container(
                  width: double.infinity,
                  child: Image.file(
                    _storedImage as File,
                    fit: BoxFit.cover,
                  ),
                )
              : Text(
                  "No Image Is Selected",
                  textAlign: TextAlign.center,
                ),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              _pickImageGallery();
            },
            icon: Icon(Icons.camera),
            label: const Text(
              "Select Image",
            ),
          ),
        )
      ],
    );
  }
}
