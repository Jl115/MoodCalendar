import 'dart:convert';

class Content {
  Content({
    required this.id,
    required this.quote,
    required this.author,
  });

  String id;
  String quote;
  String author;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
