import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/responsive_widget.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  final int duration;
  final complexity;
  final Affordability affordability;

  MealItem(
      {this.id,
      this.title,
      this.description,
      this.imageURL,
      this.duration,
      this.complexity,
      this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  // void selectMeal(BuildContext context) {
  //   Navigator.of(context).pushNamed(
  //     MealDetailScreen.routeName,
  //     arguments: {
  //       id,
  //     },
  //   ).then((result) {
  //     if (result != null) {}
  //   });
  //   Navigator.pushNamed(
  //     context,
  //     'meal-detail',
  //     arguments: {
  //       'id': id,
  //     },
  //   );
  // }

  void selectMeal(BuildContext context) {
    // Navigator.pushNamed(
    //   context,
    //   'meal-detail',
    //   arguments: {
    //     id,
    //   },
    // )
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).highlightColor,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 1,
              //     blurRadius: 6,
              //     offset: Offset(0, 1),
              //   )
              // ],
            ),
            height: 130,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageURL),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).focusColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).hintColor),
                              child: Icon(Icons.schedule),
                            ),
                            Text(
                              '$duration min',
                              style: TextStyle(fontSize: 14),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).hintColor),
                              child: Icon(Icons.work),
                            ),
                            Text(
                              complexityText,
                              style: TextStyle(fontSize: 14),
                            ),
                            // Container(
                            //   height: 30,
                            //   width: 30,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(5),
                            //       color: Colors.green[100]),
                            //   child: Icon(Icons.attach_money),
                            // ),
                            // Text(affordabilityText),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[700],
          ),
        ],
      ),

      // child: Card(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   elevation: 4,
      //   margin: EdgeInsets.all(10),
      //   child: Column(
      //     children: <Widget>[
      //       Stack(
      //         children: <Widget>[
      //           ClipRRect(
      //             borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(15),
      //               topRight: Radius.circular(15),
      //             ),
      //             child: Image.network(
      //               imageURL,
      //               height: ResponsiveWidget.isLargeScreen(context) ? 300 : 200,
      //               width: double.infinity,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           Positioned(
      //             bottom: 20,
      //             right: 0,
      //             child: Container(
      //               width: 300,
      //               color: Colors.black54,
      //               padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      //               child: Text(
      //                 title,
      //                 style: TextStyle(fontSize: 26, color: Colors.white),
      //                 softWrap: true,
      //                 overflow: TextOverflow.fade,
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //       Padding(
      //         padding: EdgeInsets.all(20),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: <Widget>[
      //             Row(children: <Widget>[
      //               Icon(Icons.schedule),
      //               SizedBox(width: 6),
      //               Text('$duration min'),
      //             ]),
      //             Row(children: <Widget>[
      //               Icon(Icons.work),
      //               SizedBox(width: 6),
      //               Text(complexityText),
      //             ]),
      //             Row(children: <Widget>[
      //               Icon(Icons.attach_money),
      //               SizedBox(width: 6),
      //               Text(affordabilityText),
      //             ]),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
