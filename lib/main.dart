import 'package:flutter/material.dart';
import 'package:nativefeature/screens/homepage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext contx) {
    return MaterialApp(
      title: "NativeFeatures",
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: AppMainClass(),
    );
  }
}

class AppMainClass extends StatelessWidget {
  Widget build(BuildContext contx) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 20),
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
          title: Text('Places'),
        ),
        body: MyHomePageScreen());
  }
}
