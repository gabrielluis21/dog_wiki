import 'package:dog_wiki/views/dog/dog_screen.dart';
import 'package:dog_wiki/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dog Wiki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/dog', page: () => DogScreen())
      ],
    );
  }
}
