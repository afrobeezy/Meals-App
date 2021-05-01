import 'package:flutter/material.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final double height;
  const CustomTextFieldContainer({
    @required this.title,
    @required this.child,
    this.height = 0,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).focusColor,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).hintColor,
          ),
          child: child,
        ),
      ],
    );
  }
}
