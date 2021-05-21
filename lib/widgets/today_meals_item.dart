import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mealsapp/screens/today_meals_screen.dart';

class TodayMealsItem extends StatelessWidget {
  final String imageUrl,
      title,
      id,
      complexity,
      course,
      preptime,
      cooktime,
      totaltime,
      servings,
      calories,
      fat,
      protein,
      carbo,
      step1,
      step2,
      step3,
      step4,
      step5,
      item1,
      item2,
      item3,
      item4;
  const TodayMealsItem({
    this.imageUrl,
    this.course,
    this.preptime,
    this.cooktime,
    this.totaltime,
    this.servings,
    this.calories,
    this.fat,
    this.protein,
    this.carbo,
    this.title,
    this.id,
    this.complexity,
    this.step1,
    this.step2,
    this.step3,
    this.step4,
    this.step5,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => TodayMealsScreen(
              imageUrl: imageUrl,
              title: title,
              id: id,
              course: course,
              preptime: preptime,
              cooktime: cooktime,
              totaltime: totaltime,
              servings: servings,
              calories: calories,
              fat: fat,
              protein: protein,
              carbo: carbo,
              complexity: complexity,
              step1: step1,
              step2: step2,
              step3: step3,
              step4: step4,
              step5: step5,
              item1: item1,
              item2: item2,
              item3: item3,
              item4: item4,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 170,
                child: Hero(
                  tag: title,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/load/load.gif'),
                    fadeInDuration: Duration(milliseconds: 300),
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.5),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hoverColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3.5),
            Row(
              children: [
                Text(
                  course,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  ' • ',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  totaltime,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
        // child: Stack(
        //   children: [
        //     Hero(
        //       tag: title,
        //       child: FadeInImage(
        //         placeholder: AssetImage('assets/load/load.gif'),
        //         fadeInDuration: Duration(milliseconds: 300),
        //         image: CachedNetworkImageProvider(imageUrl),
        //         fit: BoxFit.cover,
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.width,
        //       ),
        //     ),
        //     Container(
        //       color: Colors.black12,
        //     ),
        //     Positioned(
        //       bottom: 10,
        //       left: 10,
        //       right: 20,
        //       child: Container(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               title,
        //               style: TextStyle(
        //                 fontFamily: 'Raleway',
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //               maxLines: 2,
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
