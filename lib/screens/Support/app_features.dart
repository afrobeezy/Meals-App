import 'package:flutter/material.dart';

class AppFeatures extends StatelessWidget {
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
                  'Downloading the Meal Bible App',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 5),
                Text(
                  'By Michael Dadzie',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'The Meal Bible app is available for download on:',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    ' • Firebase App Distribution',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple),
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
