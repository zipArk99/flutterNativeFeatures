import 'dart:io';

class Location {
  final double longitude;
  final double latitude;
  final String address;

  Location({
    required this.longitude,
    required this.latitude,
    this.address = '',
  });
}

class Place {
  final String id;
  final String placeTitle;
  final Location location;
  final File image;

  Place(
      {required this.id,
      required this.placeTitle,
      required this.location,
      required this.image});
}
