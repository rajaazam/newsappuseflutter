import 'package:bbcnews/services/api_serviceheadlines.dart';
import 'package:flutter/material.dart';
import 'package:bbcnews/components/customListTile.dart';
import 'package:bbcnews/model/article_model.dart';
//import 'package:bbcnews/services/api_serviceheadlines.dart';

class headlinesPages extends StatefulWidget {
  const headlinesPages({ Key? key }) : super(key: key);

  @override
  _headlinesPagesState createState() => _headlinesPagesState();
}

class _headlinesPagesState extends State<headlinesPages> {
   ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),

      //Now let's call the APi services with futurebuilder wiget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}