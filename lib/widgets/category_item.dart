import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  void selectCategory(BuildContext context) {
    Navigator.pushNamed(
      context,
      'category-meals',
      arguments: {
        'id': id,
        'title': title,
      },
    );
    //   Navigator.of(context).pushNamed(
    //     CategoryMealsScreen.routeName,
    //     arguments: {
    //       'id': id,
    //       'title': title,
    //     },
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).hintColor,
            ),
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(imageURL),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hoverColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
