import 'package:dog_wiki/controllers/dogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogsListTile extends StatelessWidget {
  final String dog;

  DogsListTile({this.dog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<DogsControllers>().fetchByBreed(dog);
        Get.toNamed('/dog', arguments: dog);
      },
      child: Container(
        height: 60,
        width: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
        ),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  dog,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
