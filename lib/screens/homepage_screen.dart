import 'package:flutter/material.dart';
import 'package:nativefeature/widgets/placeLIst_widget.dart';

class MyHomePageScreen extends StatelessWidget {
  Widget build(BuildContext contx) {
    return ListView.builder(
      itemBuilder: (contx, int) {
        return PlaceListWidget();
      },
      itemCount: 3,
    );
  }
}
