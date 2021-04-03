import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

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
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: MediaQuery.of(context).size.width - 30,
        child: child,
      );
    }

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
      // appBar: AppBar(
      //   title: Text(
      //     '${selectedMeal.title}',
      //     style: TextStyle(color: Colors.red),
      //   ),
      //   iconTheme: new IconThemeData(color: Colors.red),
      // ),
      // body: SingleChildScrollView(
      //   physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         height: 300,
      //         width: double.infinity,
      //         child: Image.network(
      //           selectedMeal.imageUrl,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       buildSectionTitle(
      //         context,
      //         'Ingredients',
      //       ),
      //       buildContainer(
      //         ListView.builder(
      //           itemBuilder: (ctx, index) => Card(
      //               color: Colors.red,
      //               child: Padding(
      //                 padding:
      //                     EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //                 child: Text(selectedMeal.ingredients[index]),
      //               )),
      //           itemCount: selectedMeal.ingredients.length,
      //         ),
      //       ),
      //       buildSectionTitle(context, 'Steps'),
      //       buildContainer(
      //         ListView.builder(
      //           itemBuilder: (ctx, index) => Column(
      //             children: [
      //               ListTile(
      //                 leading: CircleAvatar(
      //                   backgroundColor: Colors.red,
      //                   child: Text(
      //                     '#${(index + 1)}',
      //                     style:
      //                         TextStyle(color: Theme.of(context).accentColor),
      //                   ),
      //                 ),
      //                 title: Text(
      //                   selectedMeal.steps[index],
      //                   style: TextStyle(color: Theme.of(context).accentColor),
      //                 ),
      //               ),
      //               Divider(
      //                 color: Colors.red,
      //               ),
      //             ],
      //           ),
      //           itemCount: selectedMeal.steps.length,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 10,
      //   child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      //   backgroundColor: Colors.red,
      //   onPressed: () => toggleFavorite(mealId),
      // ),
    );
  }
}
