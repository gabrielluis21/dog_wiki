import 'package:dog_wiki/api/api_module.dart';
import 'package:get/get.dart';

class DogsControllers extends GetxController {
  var isLoading = true.obs;
  var dogs = Map<String, dynamic>().obs;
  var dogsImages = List<String>.empty().obs;

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
        dogs.assignAll(response.breeds);
      }
    } catch (err) {
      print(err);
    } finally {
      isLoading(false);
    }
  }

  void fetchByBreed(String breed) async {
    try {
      isLoading(true);
      var response = await ApiModule.fetchByBreed(breed);
      print(response.images);
      if (response != null) {
        dogsImages.assignAll(response.images);
      }
    } catch (err) {
      print(err);
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    ApiModule.dispose();
    super.dispose();
  }
}
