import 'package:flutter/material.dart';

class CommunicationsPreference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _checked = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Communications Preferences',
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'We occasionaly send you the latest dishes & promotional offeers. In order to benefit, tick the box below. If you don\'t wish to receive any newsletters or offers please untick this box. You can always adjust your prefernce here.',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: Colors.red,
                dense: true,
                title: new Text(
                  'I want to receive Meal Bible news and offers',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 14,
                    color: Theme.of(context).focusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                value: _checked,
                onChanged: (bool val) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
