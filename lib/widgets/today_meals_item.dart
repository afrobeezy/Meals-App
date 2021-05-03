import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mealsapp/screens/today_meals_screen.dart';

class TodayMealsItem extends StatelessWidget {
  final String imageUrl,
      title,
      complexity,
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
    this.title,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Stack(
            children: [
              Hero(
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
              Container(
                color: Colors.black26,
              ),
              Positioned(
                top: 10,
                left: 10,
                right: 30,
                child: Container(
                  height: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    child: Center(
                      child: Text(
                        complexity,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 20,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'ingredients',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[300],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
