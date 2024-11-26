import 'dart:convert';

import 'package:news_application/common/locators/api_info.dart';
import 'package:news_application/sources/data/data_sources/sources_data_source.dart';
import 'package:news_application/sources/data/models/sources_list_model.dart';
import 'package:http/http.dart' as http;

class SourcesApiSource extends SourcesDataSource {
  @override
  Future<List<Sources>> getSources(String categoryId) async {
    var url = Uri.https(ApiInfo.baseUrl, ApiInfo.sourcesEndpoint,
        {'apiKey': ApiInfo.apiKey, 'category': categoryId});
    var response = await http.get(url);
    String body = response.body;
    var json = jsonDecode(body);
    var newsResponce = SourceModel.fromJson(json);

    if (newsResponce.status == 'ok') {
      return newsResponce.sources ?? [];
    } else {
      throw Exception('Something went wrong !');
    }
  }
}
