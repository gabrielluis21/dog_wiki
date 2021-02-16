import 'package:dog_wiki/api/api_module.dart';
import 'package:get/get.dart';

class DogsControllers extends GetxController {
  var isLoading = true.obs;
  var dogs = Map<String, List<String>>().obs;
  var dogsImages = List<String>.empty().obs;
  Map<String, List<String>> initDogList = Map();

  @override
  void onInit() {
    fetchDogsList();
    super.onInit();
  }

  void fetchDogsList() async {
    try {
      isLoading(true);
      var response = await ApiModule.fetchAllBreeds();

      if (response != null) {
        initDogList.addAll(response.breeds);
        dogs.assignAll(response.breeds);
      }
    } catch (err) {
      print(err);
    } finally {
      isLoading(false);
    }
  }

  void fetchImages(Map<dynamic, dynamic> dog) async {
    try {
      isLoading(true);
      var response, breed, subBreed;

      if (dog.values.isNotEmpty && dog.keys.isNotEmpty) {
        for (var key in dog.keys.toList()) breed = key;
        subBreed = dog[breed];
      } else {
        for (var key in dog.keys.toList()) breed = key;
      }

      print(breed);
      print(subBreed);

      response = await ApiModule.fetchImages(breed, subBreed);

      if (response != null) {
        dogsImages.assignAll(response.images);
      }
    } finally {
      isLoading(false);
    }
  }

  void searchDog(String search) {
    var searchResult;

    for (var dog in initDogList.keys.toList()) {
      if (dog.compareTo(search) == 0) {
        searchResult = {dog: initDogList[dog]};
      }
    }

    dogs.assignAll(searchResult);
  }

  void filter(String filter) {
    if (filter.compareTo("filterBySubBreed") == 0) {
      var allSubs = Map<String, List<String>>();

      initDogList.forEach((key, value) {
        if (value.isNotEmpty) allSubs.addAll({key: value});
      });

      dogs.assignAll(allSubs);
    } else {
      dogs.assignAll(initDogList);
    }
  }

  @override
  void dispose() {
    ApiModule.dispose();
    super.dispose();
  }
}
