import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class Newsservice {
  final Dio dio;

  Newsservice(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    //  try {
    var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=82b9fd876c9d4ea4a1acd0e7e3f8c4c3&category=$category');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    // List<Map<String,dynamic>> articles = jsonData['articles'] as List<Map<String,dynamic>>;
    List<ArticleModel> articelsList = [];

    for (var element in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(element);

      articelsList.add(articleModel);
    }
    return articelsList;
    //  } on Exception catch (e) {
    //   return [];
    // }
  }
}
