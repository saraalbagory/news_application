import 'package:flutter/material.dart';
import 'package:news_application/common/locators/data_sources_locator.dart';
import 'package:news_application/sources/data/models/sources_list_model.dart';
import 'package:news_application/sources/reporsitry/sources_repositry.dart';

class SourcesProvider with ChangeNotifier {
  SourcesRepositry sourcesRepositry;
  SourcesProvider()
      : sourcesRepositry =
            SourcesRepositry(dataSource: DataSourcesLocator.sourcesDataSource);
  List<Sources> ?sources;
  bool waiting=false;
  String ?errorMessage;
  Future getSources(String categoryId) async{
    waiting =true;
    notifyListeners();
    try{
      sources=await sourcesRepositry.getSources(categoryId);
    }
    catch(e){
      errorMessage=e.toString();
    }
    waiting=false;
    notifyListeners();
    
  }
}
