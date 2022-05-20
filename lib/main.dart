import 'package:flutter/material.dart';
import 'package:nativefeature/providers/place_provider.dart';
import 'package:nativefeature/screens/add_place_screen.dart';
import 'package:nativefeature/screens/homepage_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const myAppRoute = "/MyAppRoute";
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
        initialRoute: '/',
        routes: {
          MyApp.myAppRoute: (contx) => MyApp(),
          AddPlaceWidget.addPlaceWidgetRoute: (contx) => AddPlaceWidget(),
        },
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
              onPressed: () {
                Navigator.of(contx)
                    .pushNamed(AddPlaceWidget.addPlaceWidgetRoute);
              },
              icon: Icon(Icons.add),
            ),
          ],
          title: Text('Places'),
        ),
        body: MyHomePageScreen());
  }
}
