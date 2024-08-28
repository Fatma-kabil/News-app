import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: Colors.amberAccent),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // const SliverToBoxAdapter(
          // child: SizedBox(
          // height: 10, // Adjust the height as per your requirement
          //  ),
          //  ),
          NewsListViewBuilder(
            category: category,
          ),
        ],
      ),
    );
  }
}
