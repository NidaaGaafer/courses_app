import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/categories.dart';
import 'package:courses_app/models/instructor.dart';

class Course {
  String? id;
  String? title;
  String? image;
  String? currency;
  String? rank;
  bool? has_certificate;
  Category? category;
  Instructor? instractor;
  double? rating;
  double? price;
  int? total_houres;

  Course.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    image = data['image'];
    currency = data['currency'];
    has_certificate = data['has_certificate'];
    category =
        data['category'] != null ? Category.fromJson(data['category']) : null;

    instractor = data['instructor'] != null
        ? Instructor.fromJson(data['instructor'])
        : null;
    rating = data['rating'] is int
        ? (data['rating'] as int).toDouble()
        : data['rating'];
    rank = data['rank'];
    price = data['price'] is int
        ? (data['price'] as int).toDouble()
        : data['price'];
    total_houres = data['total_houres'];
  }
}
