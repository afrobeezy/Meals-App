import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).focusColor),
      ),
    );
  }
}
