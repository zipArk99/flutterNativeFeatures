import 'package:flutter/material.dart';
import 'package:nativefeature/providers/place_provider.dart';
import 'package:nativefeature/widgets/placeLIst_widget.dart';
import 'package:provider/provider.dart';

class MyHomePageScreen extends StatelessWidget {
  late PlaceProvider placeProvider;

  Widget build(BuildContext contx) {
    print("-----hey------");

    return FutureBuilder(
      future: Provider.of<PlaceProvider>(contx, listen: false).fetchData(),
      builder: (contx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
         return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Consumer<PlaceProvider>(
          builder: (contx, placeProvider, ch) {
            return ListView.builder(
              itemBuilder: (contx, int) {
                return PlaceListWidget(
                  image: placeProvider.getPlaceList[int].image,
                  title: placeProvider.getPlaceList[int].placeTitle,
                );
              },
              itemCount: placeProvider.getPlaceList.length,
            );
          },
        );
      },
    );
  }
}
