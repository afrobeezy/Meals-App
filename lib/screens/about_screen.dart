import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'About',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).focusColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Version 1.2.2',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).hoverColor),
              ),
              SizedBox(height: 20),
              Text(
                'Build version 1.2.2(1001)',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700]),
              ),
              SizedBox(height: 5),
              Text(
                'Codepush version v1.2.2',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
