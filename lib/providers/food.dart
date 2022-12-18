import 'package:flutter/foundation.dart';

class Food extends ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imgUrl;
  bool is_favourite;

  Food({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imgUrl,
    this.is_favourite = false,
  });

  toggoleFavouriteData() {
    is_favourite = !is_favourite;

    notifyListeners();
  }
}
