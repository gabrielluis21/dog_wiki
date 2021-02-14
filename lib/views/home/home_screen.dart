import 'package:dog_wiki/controllers/dogs_controller.dart';
import 'package:dog_wiki/views/home/widget/dogs_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DogsControllers _controller = Get.put(DogsControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Wiki"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var dogList = _controller.dogs.keys.toList();
          return ListView.builder(
            itemCount: dogList.length,
            itemBuilder: (context, index) {
              return DogsListTile(
                dog: dogList[index],
              );
            },
          );
        }
      }),
    );
  }
}
