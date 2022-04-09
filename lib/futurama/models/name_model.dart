class Name {
  Name({
    required this.first,
    required this.middle,
    required this.last,
  });

  String first;
  String middle;
  String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"],
        middle: json["middle"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "middle": middle,
        "last": last,
      };
}
