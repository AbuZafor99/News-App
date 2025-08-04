import 'dart:convert';

import 'package:news_app/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/show_category.dart';
class ShowCategoryNews{
  List<ShowCategoryModel> categoryList=[];

  Future<List<ShowCategoryModel>> getCategory(String category)async{

    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=79a1f95f811a4ac98a8067c9d0a7a81a";
    var response= await http.get(Uri.parse(url));
    var jsonDate= jsonDecode(response.body);

    if(jsonDate['status']=="ok"){
      jsonDate["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ShowCategoryModel showCategoryModel=ShowCategoryModel(
              imageUrl: element["urlToImage"],
              descrp: element["description"],
              title: element["title"]
          );
          categoryList.add(showCategoryModel);
        }
      }
      );
    }
    return categoryList;
  }
}