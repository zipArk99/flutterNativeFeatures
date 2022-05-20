import 'package:flutter/material.dart';
import 'package:nativefeature/widgets/image_input.dart';

class AddPlaceWidget extends StatefulWidget {
  static String addPlaceWidgetRoute = '/AddPlaceWidget';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddPlaceWidgetState();
  }
}

class AddPlaceWidgetState extends State<AddPlaceWidget> {
  late TextEditingController _titleController;
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
              ImageInputWidget(),
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
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Add Place"),
        ),
      ),
    );
  }
}
