import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mealsapp/models/user_model.dart';
import 'package:mealsapp/screens/login_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import './data/dummy_data.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import './models/meal.dart';
import 'package:mealsapp/utils/const.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final Box<UserModel> _userBox = await _hiveSetup();
  runApp(MyApp(
    userBox: _userBox,
  ));
}

Future<Box<UserModel>> _hiveSetup() async {
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  final Box<UserModel> _userBox = await Hive.openBox<UserModel>('userModel');
  return _userBox;
}

class MyApp extends StatefulWidget {
  final Box<UserModel> userBox;
  MyApp({this.userBox});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return Provider<Box<UserModel>>(
      create: (context) => widget.userBox,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal Bible',
        theme: Constants.lightTheme,
        darkTheme: Constants.darkTheme,
        // home: LoginScreen(),
        initialRoute: widget.userBox.isEmpty
            ? LoginScreen.routeName
            : TabsScreen.routeName,
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(_favoriteMeals),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavorite, isMealFavorite),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        },
        // ignore: missing_return
        onGenerateRoute: (settings) {
          print(settings.arguments);
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (ctx) => TabsScreen(_favoriteMeals));
        },
      ),
    );
  }
}
