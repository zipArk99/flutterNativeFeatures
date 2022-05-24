import 'package:flutter/material.dart';
import 'package:nativefeature/providers/place_provider.dart';
import 'package:nativefeature/widgets/image_input.dart';
import 'package:nativefeature/widgets/location_input.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddPlaceWidget extends StatefulWidget {
  static String addPlaceWidgetRoute = '/AddPlaceWidget';
  @override
  State<StatefulWidget> createState() {
    return AddPlaceWidgetState();
  }
}

class AddPlaceWidgetState extends State<AddPlaceWidget> {
  late TextEditingController _titleController;
  File? _pickedImage;

  void getPlaceImage(File image) {
    _pickedImage = image;
  }

  void addPlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<PlaceProvider>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage as File);
    Navigator.of(context).pop();
  }

  Widget build(BuildContext contx) {
    _titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
              ),
              SizedBox(
                height: 70,
              ),
              ImageInputWidget(
                passFile: getPlaceImage,
              ),
              SizedBox(
                height: 50,
              ),
              LocationWidget(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.black,
              primary: Colors.amber,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: () {
            addPlace();
          },
          icon: Icon(Icons.add),
          label: Text("Add Place"),
        ),
      ),
    );
  }
}
