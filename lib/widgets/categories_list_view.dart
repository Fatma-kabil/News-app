import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = [
    CategoryModel(
        imageAssetUrl: 'assets/business.jpeg', categoryName: "Business"),
    CategoryModel(
        imageAssetUrl: 'assets/entertainment.jpg',
        categoryName: "Entertainment"),
    CategoryModel(imageAssetUrl: 'assets/general.png', categoryName: "General"),
    CategoryModel(imageAssetUrl: 'assets/health.jpg', categoryName: "Health"),
    CategoryModel(
        imageAssetUrl: 'assets/science.jpeg', categoryName: "Science"),
    CategoryModel(imageAssetUrl: 'assets/sports.jpg', categoryName: "Sports"),
    CategoryModel(
        imageAssetUrl: 'assets/technology.jpeg', categoryName: "Technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}
