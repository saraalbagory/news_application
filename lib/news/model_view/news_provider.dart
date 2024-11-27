import 'package:flutter/material.dart';
import 'package:news_application/common/locators/data_sources_locator.dart';
import 'package:news_application/news/data/models/artical_model.dart';
import 'package:news_application/news/repositry/news_repositry.dart';

class NewsProvider with ChangeNotifier{
  NewsRepositry newsRepositry;
  NewsProvider():newsRepositry=NewsRepositry(DataSourcesLocator.newsDataSource);
  bool waiting=false;
  List<ArticalModel>? news;
  String? errorMessage;
  Future getNews(String sourceId) async{
    waiting=true;
    notifyListeners();
    try{
      news=await newsRepositry.getNews(sourceId);
    }
    catch(e)
    {
      errorMessage=e.toString();
    }
    waiting=false;
    notifyListeners();
  }


}