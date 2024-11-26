class SourceModel {
  String? status;
  List<Sources>? sources;

  SourceModel({this.status, this.sources});

  SourceModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    sources = json["sources"] == null
        ? null
        : (json["sources"] as List).map((e) => Sources.fromJson(e)).toList();
  }

  static List<SourceModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SourceModel.fromJson).toList();
  }
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Sources.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  static List<Sources> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sources.fromJson).toList();
  }
}