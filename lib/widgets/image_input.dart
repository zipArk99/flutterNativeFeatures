import 'package:flutter/material.dart';
import 'dart:io';

class ImageInputWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageInputWidgetState();
  }
}

class ImageInputWidgetState extends State<ImageInputWidget> {
  File? _storedImage;
  Widget build(BuildContext contx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
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
              ? Image.file(
                  _storedImage as File,
                  fit: BoxFit.cover,
                )
              : Text(
                  "No Image Is Selected",
                  textAlign: TextAlign.center,
                ),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
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
