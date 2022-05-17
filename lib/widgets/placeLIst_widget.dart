import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
  Widget build(BuildContext contx) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      height: 100,
      child: Card(
        elevation: 5,
        child: ListTile(
          tileColor: Colors.white38,
        ),
      ),
    );
  }
}
