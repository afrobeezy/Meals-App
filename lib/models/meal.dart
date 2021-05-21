import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final title;
  final description;
  final course;
  final servings;
  final calories;
  final fat;
  final protein;
  final carbo;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final String totaltime;
  final String preptime;
  final String cooktime;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.description,
      @required this.course,
      @required this.servings,
      @required this.calories,
      @required this.fat,
      @required this.protein,
      @required this.carbo,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.cooktime,
      @required this.preptime,
      @required this.totaltime,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
