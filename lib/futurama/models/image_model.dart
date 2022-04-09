class Images {
  Images({
    required this.headShot,
    required this.main,
  });

  String headShot;
  String main;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        headShot: json["head-shot"],
        main: json["main"],
      );

  // Map<String, dynamic> toJson() => {
  //     "head-shot": headShot,
  //     "main": main,
  // };
}
