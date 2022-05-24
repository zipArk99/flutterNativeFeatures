import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;

class LocationWidget extends StatefulWidget {
  @override
  State createState() {
    return LocationWidgetState();
  }
}

class LocationWidgetState extends State<LocationWidget> {
  late String locationImageUrl = '';
  late loc.Location location;
  late bool _serviceEnabled;
  late loc.PermissionStatus _permissionGranted;
  late loc.LocationData _locationData;

  void getLocationData() async {
    location = loc.Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print("longtiude::" + _locationData.longitude.toString());
    print("latitude::" + _locationData.latitude.toString());
  }

  Widget build(BuildContext contx) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: locationImageUrl == ''
              ? Text("No Location Selected")
              : Image.network(locationImageUrl),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(),
              onPressed: () {
                 getLocationData();
              },
              icon: Icon(
                Icons.location_on,
              ),
              label: Text(
                'Current Location',
                style: TextStyle(fontSize: 13),
              ),
            ),
            TextButton.icon(
              onPressed: () {
               
              },
              icon: Icon(Icons.map),
              label: Text(
                'Select on Map',
                style: TextStyle(fontSize: 13),
              ),
            )
          ],
        )
      ],
    );
  }
}
