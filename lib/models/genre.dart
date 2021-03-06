import 'dart:convert';

class Genre {
  int id;
  String name;
  Genre({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromJson(Map<String, dynamic> map) {
    return Genre(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory Genre.fromJson(String source) => Genre.fromMap(json.decode(source));
}
