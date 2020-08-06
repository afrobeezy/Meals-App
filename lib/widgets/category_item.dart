import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageURL;

  CategoryItem(
    this.id,
    this.title,
    this.color,
    this.imageURL,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageURL),
            fit: BoxFit.cover,
          ),
//          gradient: LinearGradient(
//            colors: [
//              color.withOpacity(0.7),
//              color,
//            ],
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
