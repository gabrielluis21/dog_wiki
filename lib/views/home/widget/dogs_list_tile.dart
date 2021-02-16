import 'package:dog_wiki/controllers/dogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogsListTile extends StatelessWidget {
  final String breed;
  final List<String> subBreed;
  DogsListTile({this.breed, this.subBreed});

  @override
  Widget build(BuildContext context) {
    return subBreed.isNotEmpty
        ? Card(
            margin: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  breed,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  height: 5,
                ),
                Container(
                  height: subBreed.length <= 3 ? 90 : 127,
                  child: Center(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: subBreed.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            var dog = {breed: subBreed[index]};
                            Get.find<DogsControllers>().fetchImages(dog);
                            Get.toNamed('/dog', arguments: dog);
                          },
                          child: Text(
                            '${subBreed[index]}',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              var dog = {breed: subBreed};
              Get.find<DogsControllers>().fetchImages(dog);
              Get.toNamed('/dog', arguments: dog);
            },
            child: Card(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    breed,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    height: 5,
                  ),
                  Text("No SubBreed")
                ],
              ),
            ),
          );
  }
}
