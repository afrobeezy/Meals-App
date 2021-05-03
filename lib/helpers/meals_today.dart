import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mealsapp/models/today_meals.dart';

class MealsToday with ChangeNotifier {
  List<TodayMeals> mealsToday = [];
  Future<void> getMealsToday() async {
    String url = "https://meal-bible-default-rtdb.firebaseio.com/.json";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    try {
      if (jsonData['status'] == "ok") {
        jsonData["meals"].forEach((element) {
          if (element['imageUrl'] != null) {
            TodayMeals meals = TodayMeals(
              id: element['id'],
              title: element['title'],
              affordability: element['affordability'],
              complexity: element['complexity'],
              duration: element['duration'],
              imageUrl: element['imageUrl'],
              step1: element['step1'],
              step2: element['step2'],
              step3: element['step3'],
              step4: element['step4'],
              step5: element['step5'],
              item1: element['item1'],
              item2: element['item2'],
              item3: element['item3'],
              item4: element['item4'],
            );
            mealsToday.add(meals);
          }
        });
      }
    } catch (error) {
      print(error);
    }
  }
}
