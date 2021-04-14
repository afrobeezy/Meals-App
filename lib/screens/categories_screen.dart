import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                        text: 'Hello, ',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).hoverColor),
                        children: [
                          TextSpan(
                            text: 'Michael',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    child: Text(
                      'What would you like to cook today ?',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hoverColor),
                    ),
                  ),
                ),
              ),
              Container(
                height: 935,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  physics: NeverScrollableScrollPhysics(),
                  children: DUMMY_CATEGORIES
                      .map(
                        (catData) => CategoryItem(
                          catData.id,
                          catData.title,
                          catData.color,
                          catData.imageURL,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
