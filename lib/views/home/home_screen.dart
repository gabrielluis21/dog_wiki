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
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Dog Wiki"),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value.contains("clearSearch")) {
                _searchController.text = "";
                _controller.filter('showAll');
              }
              _controller.filter(value);
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "showAll",
                child: Text('Show All'),
              ),
              const PopupMenuItem<String>(
                value: "filterBySubBreed",
                child: Text('Show All SubBreed'),
              ),
              const PopupMenuItem<String>(
                value: "vlearSearch",
                child: Text('Clear Search'),
              ),
            ],
          )
        ],
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 250,
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.search),
                            labelText: "Search any dog"),
                      ),
                    ),
                    ElevatedButton.icon(
                        style: ButtonStyle(),
                        onPressed: () {
                          _controller.searchDog(_searchController.text);
                        },
                        icon: Icon(Icons.search),
                        label: Text("Search"))
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 6,
                child: ListView.builder(
                  itemCount: _controller.dogs.length,
                  itemBuilder: (context, index) {
                    var breedList = _controller.dogs.keys.toList();
                    var subBreedList = _controller.dogs.values.toList();
                    return DogsListTile(
                        breed: breedList[index], subBreed: subBreedList[index]);
                  },
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
