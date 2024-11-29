import 'package:news_application/news/data/models/artical_model.dart';

abstract class NewsDataSource {
  Future<List<ArticalModel>>getNews(String sourceId,String pageNo);
  Future<List<ArticalModel>> searchNews(
    String categoryId, String searchText) ;
}