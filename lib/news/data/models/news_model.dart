import 'package:news_application/news/data/models/artical_model.dart';

//based on what will be received from the api
class NewsModel {
  final String? status;
  final  int? totalResults;
  final List<ArticalModel>? articles;
  const NewsModel({this.status, this.totalResults, this.articles});

  @override
  String toString() {
    return 'NewsModel(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => ArticalModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

}
