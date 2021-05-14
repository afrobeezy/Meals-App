import 'package:flutter/material.dart';

class AboutMealBible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).focusColor),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How to contact Meal Bible:',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 5),
                Text(
                  'By Deladem Demanya',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'How to contact Meal Bible',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 18),
                Text(
                  ' • Through the Help section in the app(select the relevant category and article)',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 5),
                Text(
                  ' • Via the eamil that you can find on our website',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hoverColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
