import 'package:flutter/material.dart';

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
    );
  }
}
