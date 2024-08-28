class ArticleModel {
  final String? image;
  final String title;
  final String? subtitle;
  final String newsUrl;

  ArticleModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.newsUrl});

  factory ArticleModel.fromJson(json){
    return ArticleModel(
           image: json['urlToImage'],
          title: json['title'],
          subtitle: json['description'],
          newsUrl: json["url"]
    );}
}
