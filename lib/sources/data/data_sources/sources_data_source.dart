import 'package:news_application/sources/data/models/sources_list_model.dart';

abstract class SourcesDataSource {
  Future<List<Sources>> getSources(String categoryId);
}
