import 'package:flutter/cupertino.dart';
import 'package:nativefeature/models/place_model.dart';
import 'dart:io';
import 'package:uuid/uuid.dart' as uuid;
import 'package:nativefeature/database/helperDb.dart';

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
    HelperDb.insertData('great_places2', {
      'id': place.id,
      'title': place.placeTitle,
      'image': place.image.path,
    });
  }

  Future<void> fetchData() async {
    final data = await HelperDb.fetchData('great_places2');

    _placeList = data.map((data) {
      print(data['title']);
      return Place(
          id: data['id'],
          placeTitle: data['title'],
          location: Location(latitude: 0, longitude: 0),
          image: File(data['image']));
    }).toList();

    print(_placeList.length);

    notifyListeners();
  }

  void deletePlace() {}
}
