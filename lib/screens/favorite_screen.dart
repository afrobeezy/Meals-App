import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget get menuButton {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 3, width: 24, color: Theme.of(context).hoverColor),
          SizedBox(height: 3),
          Container(height: 3, width: 12, color: Theme.of(context).hoverColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: menuButton,
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
          ),
          centerTitle: false,
          title: Text(
            'My Favorites',
            style: TextStyle(color: Theme.of(context).focusColor),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: new IconThemeData(color: Colors.red),
          elevation: 0.0,
        ),
        key: scaffoldKey,
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              'You have no favorites',
              style:
                  TextStyle(color: Theme.of(context).focusColor, fontSize: 20),
            ),
          ),
        ),
      );
    } else
      return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favoriteMeals[index].id,
              title: widget.favoriteMeals[index].title,
              imageURL: widget.favoriteMeals[index].imageUrl,
              duration: widget.favoriteMeals[index].duration,
              affordability: widget.favoriteMeals[index].affordability,
              complexity: widget.favoriteMeals[index].complexity,
            );
          },
          itemCount: widget.favoriteMeals.length,
        ),
      );
  }
}
