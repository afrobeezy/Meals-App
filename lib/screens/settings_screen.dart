import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mealsapp/screens/language_screen.dart';
import 'package:mealsapp/screens/communications_preference.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).focusColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                focusColor: Colors.transparent,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => LanguageScreen(),
                    ),
                  );
                },
                title: Text(
                  'Language',
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
                      builder: (context) => CommunicationsPreference(),
                    ),
                  );
                },
                title: Text(
                  'Communication Preferences',
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
    );
  }
}
