import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../data/dummy_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: child,
        ),
      );
    }

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Theme.of(context).focusColor),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  '${selectedMeal.title}',
                  style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(selectedMeal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '${selectedMeal.description}',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Prep Time',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Text(
                        '${selectedMeal.preptime} min',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Cook Time',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Text(
                        '${selectedMeal.cooktime} min',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Total Time',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Text(
                        '${selectedMeal.totaltime} min',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSectionTitle(context, 'Course'),
                  Text(
                    '${selectedMeal.course}',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hoverColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSectionTitle(context, 'Ingredients'),
                  Container(
                    height: 25,
                    width: 80,
                    child: Center(
                      child: Text(
                        '${selectedMeal.servings}',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).highlightColor,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).hoverColor),
                  )
                ],
              ),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    elevation: 0,
                    color: Theme.of(context).hintColor,
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            '${selectedMeal.calories}',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Calories',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'kcal',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            '${selectedMeal.fat}',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Fat',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'g',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            '${selectedMeal.protein}',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Protein',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'g',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).hintColor,
                        child: Center(
                          child: Text(
                            '${selectedMeal.carbo}',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Carbo',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'g',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).hintColor),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text(
                              '${(index + 1)}',
                              style: TextStyle(
                                  color: Theme.of(context).focusColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        splashColor: Colors.transparent,
        elevation: 0,
        child: Icon(isFavorite(mealId)
            ? FlutterIcons.bookmark_faw
            : FlutterIcons.bookmark_faw5),
        backgroundColor: Theme.of(context).focusColor,
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
