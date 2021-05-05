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
                child: Hero(
                  tag: selectedMeal.title,
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(selectedMeal.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              buildSectionTitle(
                context,
                'Ingredients',
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
