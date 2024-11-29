import 'package:news_application/news/data/data_sources/news_api_source.dart';
import 'package:news_application/news/data/data_sources/news_data_source.dart';
import 'package:news_application/sources/data/data_sources/sources_api_source.dart';
import 'package:news_application/sources/data/data_sources/sources_data_source.dart';

class DataSourcesLocator {

  static SourcesDataSource sourcesDataSource=SourcesApiSource();
  static NewsDataSource newsDataSource=NewsApiSource();
}