import 'package:news_application/sources/data/data_sources/sources_api_source.dart';
import 'package:news_application/sources/data/data_sources/sources_data_source.dart';

class DataSourcesLocator {

  static SourcesDataSource sourcesDataSource=SourcesApiSource();
}