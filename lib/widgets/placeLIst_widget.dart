import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
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
              tileColor: Colors.white38,
              leading: transfromOffset(
                child: CircleAvatar(
                  radius: 50,
                ),
                horizontal: -30,
              ),
              title: transfromOffset(child: Text('Place 1'), horizontal: -50),
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
