import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imageURL;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.yellow,
    @required this.imageURL,
  });
}
