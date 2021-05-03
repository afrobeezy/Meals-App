import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:mealsapp/models/user_info_model.dart';
import 'package:mealsapp/models/user_model.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:mealsapp/screens/settings_screen.dart';
import 'package:mealsapp/screens/about_screen.dart';
import 'package:mealsapp/screens/help_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget get menuButton {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 3, width: 24, color: Theme.of(context).hoverColor),
          SizedBox(height: 3),
          Container(height: 3, width: 12, color: Theme.of(context).hoverColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Box<UserInfoModel> _userInfoBox =
        Provider.of<Box<UserInfoModel>>(context);
    final UserInfoModel _userInfoModel = _userInfoBox.values.first;
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);
    final UserModel _userModel = _userBox.values.first;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: menuButton,
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
        ),
        centerTitle: false,
        title: Text(
          'My Account',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: new IconThemeData(color: Colors.red),
        elevation: 0.0,
      ),
      key: scaffoldKey,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _userModel.displayName,
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).hoverColor),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _userModel.emailId,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(_userInfoModel.photoUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              SizedBox(height: 40),
              CustomListTile(
                tap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                name: 'Settings',
                icon: Icons.settings_outlined,
              ),
              SizedBox(height: 25),
              CustomListTile(
                tap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  );
                },
                name: 'About',
                icon: Icons.info_outlined,
              ),
              SizedBox(height: 25),
              CustomListTile(
                tap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HelpScreen(),
                    ),
                  );
                },
                name: 'Help',
                icon: Icons.help_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function tap;
  const CustomListTile({
    @required this.name,
    @required this.icon,
    @required this.tap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).focusColor,
          ),
          SizedBox(width: 15),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).focusColor,
            ),
          ),
        ],
      ),
    );
  }
}
