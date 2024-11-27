import 'package:news_application/news/data/data_sources/news_data_source.dart';
import 'package:news_application/news/data/models/artical_model.dart';

class NewsRepositry {
  NewsDataSource newsSource;
  NewsRepositry(this.newsSource);
  Future<List<ArticalModel>> getNews(String sourceId) async{
    return await newsSource.getNews(sourceId);
  }
  
}