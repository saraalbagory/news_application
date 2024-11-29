import 'dart:convert';

import 'package:news_application/common/locators/api_info.dart';
import 'package:news_application/news/data/data_sources/news_data_source.dart';
import 'package:news_application/news/data/models/artical_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/news/data/models/news_model.dart';

class NewsApiSource extends NewsDataSource {
  @override
  Future<List<ArticalModel>> getNews(String sourceId, String pageNo) async {
    var url = Uri.https(ApiInfo.baseUrl, ApiInfo.newsEndpoint, {
      'apiKey': ApiInfo.apiKey,
      'sources': sourceId,
      'pageSize': '5',
      'page': pageNo
    });
    var response = await http.get(url);
    String body = response.body;
    var bodyJson = jsonDecode(body);
    var newsReturned = NewsModel.fromJson(bodyJson);
    if (newsReturned.status == "ok") {
      return newsReturned.articles ?? [];
    } else {
      throw newsReturned.status.toString();
    }
  }

  @override
  Future<List<ArticalModel>> searchNews(
      String categoryId, String searchText) async {
    var url = Uri.https(
      ApiInfo.baseUrl,
      ApiInfo.newsEndpoint,
      {
        'apiKey': ApiInfo.apiKey,
        'searchIn': 'title',
        'category': categoryId,
        'q': searchText
      },
    );
    var response = await http.get(url);
    String body = response.body;
    var bodyJson = jsonDecode(body);
    var newsReturned = NewsModel.fromJson(bodyJson);
    if (newsReturned.status == "ok") {
      print("search is succesful");
      return newsReturned.articles ?? [];
    } else {
      throw newsReturned.status.toString();
    }
  }
}
