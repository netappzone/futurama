import 'image_model.dart';
import 'name_model.dart';

class Character {
  Character({
    required this.name,
    required this.images,
    required this.gender,
    required this.species,
    required this.homePlanet,
    required this.occupation,
    required this.sayings,
    required this.id,
    required this.age,
  });

  Name name;
  Images images;
  String gender;
  String species;
  String homePlanet;
  String occupation;
  List<String> sayings;
  int id;
  String age;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: Name.fromJson(json["name"]),
        images: Images.fromJson(json["images"]),
        gender: json["gender"],
        species: json["species"],
        homePlanet: json["homePlanet"],
        occupation: json["occupation"],
        sayings: List<String>.from(json["sayings"].map((x) => x)),
        id: json["id"],
        age: json["age"],
      );

  // Map<String, dynamic> toJson() => {
  //     "name": name.toJson(),
  //     "images": images.toJson(),
  //     "gender": gender,
  //     "species": species,
  //     "homePlanet": homePlanet,
  //     "occupation": occupation,
  //     "sayings": List<dynamic>.from(sayings.map((x) => x)),
  //     "id": id,
  //     "age": age,
  // };
}
