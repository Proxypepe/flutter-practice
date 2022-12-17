const String idTitle = "id";
const String nameTitle = "name";
const String descriptionTitle = "description";
const String prepareTitle = "prepare";
const String cookTitle = "cook";
const String ingredientsTitle = "ingredients";
const String stepsTitle = "steps";
const String fileNameTitle = "fileName";
const String tagTitle = "tags";

class RecipeEntity {
  int? id = 0;
  String? name;
  String? description;
  String? prepare;
  String? cook;
  int? ingredients;
  int? steps;
  String? fileName;
  List<String>? tags;

  RecipeEntity(
      {this.id,
      required this.name,
      required this.description,
      required this.prepare,
      required this.cook,
      required this.ingredients,
      required this.steps,
      required this.fileName,
      required this.tags});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      nameTitle: name,
      descriptionTitle: description,
      prepareTitle: prepare,
      cookTitle: cook,
      ingredientsTitle: ingredients,
      stepsTitle: steps,
      fileNameTitle: fileName,
      tagTitle: tags?.join(","),
    };
    if (id != null) {
      map[idTitle] = id;
    }
    return map;
  }

  RecipeEntity.fromMap(Map<dynamic, dynamic> map) {
    id = map[idTitle] as int?;
    name = map[nameTitle] as String?;
    description = map[descriptionTitle] as String?;
    prepare = map[prepareTitle] as String?;
    cook = map[cookTitle] as String?;
    ingredients = map[ingredientsTitle] as int?;
    steps = map[stepsTitle] as int?;
    fileName = map[fileNameTitle] as String?;
    var tagsList = map[tagTitle] as String?;
    tags = tagsList?.split(',');
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
