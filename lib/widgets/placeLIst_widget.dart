import 'dart:io';

import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
  final String title;
  final File image;

  PlaceListWidget({
    required this.title,
    required this.image,
  });

  Widget transfromOffset(
      {required Widget child, double verticle = 0, double horizontal = 0}) {
    return Transform.translate(
      offset: Offset(horizontal, verticle),
      child: child,
    );
  }

  Widget build(BuildContext contx) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(5),
          child: ListTile(
              tileColor: Colors.white70,
              leading: transfromOffset(
                child: CircleAvatar(
                  backgroundImage: FileImage(image, scale: 0.5),
                  radius: 50,
                ),
                horizontal: -30,
              ),
              title: transfromOffset(child: Text(title), horizontal: -50),
              subtitle: transfromOffset(
                horizontal: -50,
                child: Text(
                  'This place is located behind manekbaug hall',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              )),
        ),
      ),
    );
  }
}
