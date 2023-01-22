/*class Recipe {
  final int id;
  final String title;
  final String steps;
  final int duration;

  Recipe({required this.title, required this.steps, required this.duration});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      title: json['title'] as String,
      steps: json['steps'] as String,
      duration: json['duration'] as int,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {title: $title, steps: $steps, duration: $duration}';
  }
}

*/

// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  Recipe({
    required this.id,
    required this.title,
    required this.duration,
    required this.serves,
    required this.steps,
    required this.picture,
    required this.user,
    required this.category,
    required this.usesingredient,
    required this.savedby,
  });

  int id;
  String title;
  int duration;
  int serves;
  String steps;
  String picture;
  int user;
  int category;
  List<int> usesingredient;
  List<int> savedby;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        title: json["title"],
        duration: json["duration"],
        serves: json["serves"],
        steps: json["steps"],
        picture: json["picture"],
        user: json["user"],
        category: json["category"],
        usesingredient: List<int>.from(json["usesingredient"].map((x) => x)),
        savedby: List<int>.from(json["savedby"].map((x) => x)),
      );

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "duration": duration,
        "serves": serves,
        "steps": steps,
        "picture": picture,
        "user": user,
        "category": category,
        "usesingredient": List<dynamic>.from(usesingredient.map((x) => x)),
        "savedby": List<dynamic>.from(savedby.map((x) => x)),
      };
}
