import 'package:dog_wiki/controllers/dogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogScreen extends StatefulWidget {
  @override
  _DogScreenState createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  var dog = Get.arguments;
  DogsControllers controller = Get.find<DogsControllers>();

  @override
  void initState() {
    controller.fetchImages(dog);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //controller.fetchImages(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Wiki"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: controller.dogsImages.length,
              itemBuilder: (context, index) {
                return Image.network(controller.dogsImages[index]);
              });
        }
      }),
    );
  }
}
