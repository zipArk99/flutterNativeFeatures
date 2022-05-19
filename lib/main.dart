import 'package:flutter/material.dart';
import 'package:nativefeature/providers/place_provider.dart';
import 'package:nativefeature/screens/homepage_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext contx) {
    return ChangeNotifierProvider(
      create: (contx) {
        return PlaceProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "NativeFeatures",
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
            secondary: Colors.amber,
          ),
        ),
        home: AppMainClass(),
      ),
    );
  }
}

class AppMainClass extends StatelessWidget {
  Widget build(BuildContext contx) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              splashRadius: 25,
              padding: EdgeInsets.all(15),
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
