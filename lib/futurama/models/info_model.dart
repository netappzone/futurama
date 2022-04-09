import 'creator_model.dart';

class Info {
  Info({
    required this.synopsis,
    required this.yearsAired,
    required this.creators,
    required this.id,
  });

  String synopsis;
  String yearsAired;
  List<Creator> creators;
  int id;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        synopsis: json["synopsis"],
        yearsAired: json["yearsAired"],
        creators: List<Creator>.from(
            json["creators"].map((x) => Creator.fromJson(x))),
        id: json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "synopsis": synopsis,
  //       "yearsAired": yearsAired,
  //       "creators": List<dynamic>.from(creators.map((x) => x.toJson())),
  //       "id": id,
  //     };
}
