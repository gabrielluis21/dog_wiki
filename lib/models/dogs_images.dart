import 'dart:convert';

DogImages dogImagesFromJson(String str) => DogImages.fromJson(json.decode(str));

String dogImagesToJson(DogImages data) => json.encode(data.toJson());

class DogImages {
  DogImages({
    this.images,
    this.status,
  });

  List<String> images;
  String status;

  factory DogImages.fromJson(Map<String, dynamic> json) => DogImages(
        images: List<String>.from(json["message"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(images.map((x) => x)),
        "status": status,
      };
}
