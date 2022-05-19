import 'package:flutter/cupertino.dart';
import 'package:nativefeature/models/place_model.dart';
import 'dart:io';

class PlaceProvider extends ChangeNotifier {
  List<Place> _placeList = [];

  List<Place> get getPlaceList {
    return [..._placeList];
  }

  /* void set addPlace(String placeTitle, Location location, File image) {} */
  void deletePlace() {}
}
