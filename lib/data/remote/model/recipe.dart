
class Recipe {
  String? name;
  String? description;
  String? prepare;
  String? cook;
  int? ingredients;
  int? steps;
  String? fileName;
  List<String>? tags;

  Recipe({
    this.name,
    this.description,
    this.prepare,
    this.cook,
    this.ingredients,
    this.steps,
    this.fileName,
    this.tags
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    prepare = json['prepare'];
    cook = json['cook'];
    ingredients = json['ingredients'];
    steps = json['steps'];
    fileName = json['file_name'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['prepare'] = prepare;
    data['cook'] = cook;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    data['file_name'] = fileName;
    data['tags'] = tags;
    return data;
  }
}