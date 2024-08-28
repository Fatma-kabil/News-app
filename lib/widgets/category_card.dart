import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: category.categoryName,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        height: 150,
        width: 175,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(category.imageAssetUrl), fit: BoxFit.fill)),
        child: Center(
          child: Text(
            category.categoryName,
            style: const TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
