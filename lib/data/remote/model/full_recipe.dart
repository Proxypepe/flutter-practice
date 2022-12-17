class FullRecipe {
  String? name;
  String? prepare;
  String? cook;
  String? fileName;
  List<String>? tags;
  int? ingredients;
  int? steps;

  FullRecipe(
      {this.name,
      this.prepare,
      this.cook,
      this.fileName,
      this.tags,
      this.ingredients,
      this.steps});

  FullRecipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    prepare = json['prepare'];
    cook = json['cook'];
    fileName = json['file_name'];
    tags = json['tags'].cast<String>();
    ingredients = json['ingredients'];
    steps = json['steps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['prepare'] = prepare;
    data['cook'] = cook;
    data['file_name'] = fileName;
    data['tags'] = tags;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    return data;
  }
}
