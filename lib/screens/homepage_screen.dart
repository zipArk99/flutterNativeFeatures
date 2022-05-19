import 'package:flutter/material.dart';
import 'package:nativefeature/providers/place_provider.dart';
import 'package:nativefeature/widgets/placeLIst_widget.dart';
import 'package:provider/provider.dart';

class MyHomePageScreen extends StatelessWidget {
  late PlaceProvider placeProvider;

  Widget build(BuildContext contx) {
    placeProvider = Provider.of<PlaceProvider>(contx);
    return ListView.builder(
      itemBuilder: (contx, int) {
        return PlaceListWidget();
      },
      itemCount: placeProvider.getPlaceList.length,
    );
  }
}
