import 'package:news_application/common/locators/data_sources_locator.dart';
import 'package:news_application/sources/data/data_sources/sources_data_source.dart';
import 'package:news_application/sources/data/models/sources_list_model.dart';

class SourcesRepositry {
  SourcesDataSource dataSource;
  SourcesRepositry({required this.dataSource});
  Future<List<Sources>> getSources(String categoryId) async {
    return await dataSource.getSources(categoryId);
  }
}