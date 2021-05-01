import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  strokeWidth: 5,
                )),
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              bottom: 0,
              child: Icon(
                Icons.restaurant,
                color: Colors.black,
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
