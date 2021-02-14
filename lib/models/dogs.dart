import 'dart:convert';

Dog dogFromJson(String str) => Dog.fromJson(json.decode(str));

String dogToJson(Dog data) => json.encode(data.toJson());

class Dog {
  Dog({
    this.breeds,
    this.status,
  });

  Map<String, List<String>> breeds;
  String status;

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        breeds: Map.from(json["message"]).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": Map.from(breeds).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
      };
}
