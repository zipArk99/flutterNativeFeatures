import 'package:flutter/cupertino.dart';
import 'package:nativefeature/models/place_model.dart';
import 'dart:io';
import 'package:uuid/uuid.dart' as uuid;

class PlaceProvider extends ChangeNotifier {
  List<Place> _placeList = [];

  List<Place> get getPlaceList {
    return [..._placeList];
  }

  set _setPlaceList(Place place) {
    _placeList.add(place);
  }

  void addPlace(String placeTitle, File image) {
    var place = Place(
      id: uuid.Uuid().v1(),
      image: image,
      placeTitle: placeTitle,
      location: Location(latitude: 20, longitude: 0),
    );
    _setPlaceList = place;
    notifyListeners();
  }

  void deletePlace() {}
}
