import 'package:dog_wiki/models/dogs.dart';
import 'package:dog_wiki/models/dogs_images.dart';
import 'package:http/http.dart' as http;

class ApiModule {
  static var client = http.Client();

  static var _url = 'https://dog.ceo/api';

  static Future<Dog> fetchAllBreeds() async {
    var response = await client.get(_url + '/breeds/list/all');

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return dogFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<DogImages> fetchByBreed(String breed) async {
    var response = await client.get(_url + '/breed/$breed/images');

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return dogImagesFromJson(jsonString);
    } else {
      return null;
    }
  }

  static void dispose() {
    client.close();
  }
}
