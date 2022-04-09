class Creator {
  Creator({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
