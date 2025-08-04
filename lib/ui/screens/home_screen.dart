import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/ui/screens/article_screen.dart';
import 'package:news_app/ui/screens/category_news_screen.dart';

import '../../services/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool isLoadind = true;

  @override
  void initState() {
    categories = getCategories();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    articles = await newsclass.getNews();
    setState(() {
      isLoadind = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 255, 255, 255),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                    color: Color(0xff3280fe),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Nova",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Hottest News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 2.77,
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  articles[index].imageUrl!,
                                  width: MediaQuery.of(context).size.width / 2,
                                  fit: BoxFit.cover,
                                  height: 150,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                textAlign: TextAlign.center,
                                articles[index].title!,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                textAlign: TextAlign.center,
                                articles[index].descrp!,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleScreen(blogUrl:articles[index].url!)));
                              },
                              child: Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xff3280ef),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 160),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Explore",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categoryName: categories[index].categoryName,
                    image: categories[index].image,
                  );
                },
              ),
            ),
            Text(
              "Trending News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/images/news1.jpg",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Please Subscribe to Shivam's channel",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Lorem epsum fhjkfhkshf sfkasjhfkj asfhkjsafhdkj",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNewsScreen(name: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
