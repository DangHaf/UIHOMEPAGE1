import 'dart:ui';

class CategoryItem {
  final String imagePath;
  final String description;
  final Color backgroundColor;

  CategoryItem(this.imagePath, this.description, this.backgroundColor);
}

class BeautyGuideItem {
  final String imagePath;
  final String description;

  BeautyGuideItem({required this.imagePath, required this.description});
}

class StoreItem {
  final String name;
  final String address;
  final double numberStar;
  final int numberReviews;

  StoreItem(
      {required this.name,
      required this.address,
      required this.numberStar,
      required this.numberReviews});
}
