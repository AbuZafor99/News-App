import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news=[];

  Future<void> getNews()async{
    String url="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=79a1f95f811a4ac98a8067c9d0a7a81a";

    var response= await http.get(Uri.parse(url));
    
    var jsonData= jsonDecode(response.body);

    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ArticleModel articleModel=ArticleModel(
            imageUrl: element["urlToIn==mage"],
            descrp: element["description"],
            title: element["title"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}