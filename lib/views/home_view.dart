import 'package:flutter/material.dart';

import 'package:news_app/widgets/categories_list_view.dart';

import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 15,
            )),
            const NewsListViewBuilder(
              category: 'general',
            )
          ],
        ));
  }
}
