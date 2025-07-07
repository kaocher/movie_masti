
class GenresModel {
  int id;
  String name;

  GenresModel({required this.id, required this.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );

  }
}


