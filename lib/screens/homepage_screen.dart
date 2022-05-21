import 'package:flutter/material.dart';
import 'package:nativefeature/providers/place_provider.dart';
import 'package:nativefeature/widgets/placeLIst_widget.dart';
import 'package:provider/provider.dart';

class MyHomePageScreen extends StatelessWidget {
  late PlaceProvider placeProvider;

  Widget build(BuildContext contx) {
    placeProvider = Provider.of<PlaceProvider>(contx);
    return placeProvider.getPlaceList.length <= 0
        ? Center(
            child: Text("No place yet"),
          )
        : ListView.builder(
            itemBuilder: (shacontx, int) {
              return PlaceListWidget(
                image: placeProvider.getPlaceList[int].image,
                title: placeProvider.getPlaceList[int].placeTitle,
              );
            },
            itemCount: placeProvider.getPlaceList.length,
          );
  }
}
