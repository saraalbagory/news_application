import 'package:flutter/material.dart';
import 'package:news_application/common/locators/data_sources_locator.dart';
import 'package:news_application/news/data/models/artical_model.dart';
import 'package:news_application/news/repositry/news_repositry.dart';

class NewsProvider with ChangeNotifier{
  NewsRepositry newsRepositry;
  NewsProvider():newsRepositry=NewsRepositry(DataSourcesLocator.newsDataSource);
  bool waiting=false;
  bool searching=false;
  List<ArticalModel>? news=[];
  String? errorMessage;
  Future getNews(String sourceId,String pageNo) async{
    waiting=true;
    notifyListeners();
    try{
      List<ArticalModel>? newArticles=await newsRepositry.getNews(sourceId, pageNo);
      if(pageNo=="1")
      {
        news=newArticles;
      }
      else{
        news?.addAll(newArticles);
      }
    }
    catch(e)
    {
      errorMessage=e.toString();
    }
    waiting=false;
    notifyListeners();
  }
  Future searchNews(
    String categoryId, String searchText) async{
      waiting=true;
      searching=true;
      notifyListeners();
      List<ArticalModel>? searchedForArticles=await newsRepositry.searchNews(categoryId,searchText);
      try{
        
        news=searchedForArticles;
    }
    catch(e)
    {
      errorMessage=e.toString();
    }
    waiting=false;
    searching=false;
    notifyListeners();

    }


}