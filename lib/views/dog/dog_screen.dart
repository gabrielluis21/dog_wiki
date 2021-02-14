import 'package:dog_wiki/controllers/dogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogScreen extends StatelessWidget {
  final controller = Get.find<DogsControllers>();
  final breed = Get.arguments;

  @override
  Widget build(BuildContext context) {
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
          controller.fetchByBreed(breed);
          var images = controller.dogsImages.toList();
          print(images);
          return ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(images[index]);
              });
        }
      }),
    );
  }
}
