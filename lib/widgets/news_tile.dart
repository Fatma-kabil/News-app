import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/web_view_news.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return WebViewNews(
                newsurl: articleModel.newsUrl,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: articleModel.image ??
                    'https://t4.ftcdn.net/jpg/03/99/93/87/240_F_399938798_16WEGR4lYu4SO3TtVf2ZVJn1erReMKbE.jpg',
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                ),

                errorWidget: (context, url, error) => const Icon(Icons.error),

                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                // ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              articleModel.title,
              //  textAlign: TextAlign.right,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              articleModel.subtitle ?? " ",
              //  textAlign: TextAlign.right,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

//Image.network(
//            articleModel.image ??
//              "https://images.pexels.com/photos/23698640/pexels-photo-23698640/free-photo-of-a-wind-turbine-in-the-middle-of-a-field.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//        height: 200,
//      width: double.infinity,
//    fit: BoxFit.cover,
// ),

//    CachedNetworkImage(
//       imageUrl: articleModel.image,
//      placeholder: (context, url) => CircularProgressIndicator(),
//      errorWidget: (context, url, error) => Icon(Icons.error),
//    ),
