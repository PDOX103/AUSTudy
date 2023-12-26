import 'package:flutter/widgets.dart';

class Subject{
  final int id;
  final String slug;
  final String name;
  final String dsec;
  final String lecturer;
  final String image;
  final List<Color> gradiant;


  Subject({
    required this.id,
    required this.slug,
    required this.name,
    required this.dsec,
    required this.lecturer,
    required this.image,
    required this.gradiant,
});
}