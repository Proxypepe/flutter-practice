class FullRecipe {
  String? name;
  String? description;
  String? prepare;
  String? cook;
  List<String>? ingredients;
  List<String>? steps;
  String? fileName;
  List<String>? tags;

  FullRecipe({
    this.name,
    this.description,
    this.prepare,
    this.cook,
    this.ingredients,
    this.steps,
    this.fileName,
    this.tags
  });

  FullRecipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    prepare = json['prepare'];
    cook = json['cook'];
    ingredients = json['ingredients'].cast<String>();
    steps = json['steps'].cast<String>();
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