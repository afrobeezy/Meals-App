import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mealsapp/screens/Support/about_meal.dart';
import 'package:mealsapp/screens/Support/app_features.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = '/help';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Support',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).focusColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get help from our devs',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  focusColor: Colors.transparent,
                  selectedTileColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AboutMealBible(),
                      ),
                    );
                  },
                  title: Text(
                    'About Meal Bible',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Theme.of(context).focusColor),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey[700],
                    size: 17,
                  ),
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  focusColor: Colors.transparent,
                  selectedTileColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AppFeatures(),
                      ),
                    );
                  },
                  title: Text(
                    'App and Features',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Theme.of(context).focusColor),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey[700],
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
