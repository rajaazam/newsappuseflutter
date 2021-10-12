import 'package:bbcnews/model/article_model.dart';
import 'package:bbcnews/pages/articles_details_page.dart';
import 'package:flutter/material.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: unnecessary_null_comparison
          article.urlToImage != null ?
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ):
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
            image: DecorationImage(
                        image: NetworkImage('https://source.unsplash.com/weekly?coding'), 
                        fit: BoxFit.cover),

              borderRadius: BorderRadius.circular(30.0),
            ),
            
           
          ),
          SizedBox(
          height: 8.0,
          ),
          
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                    color: Colors.red,
                    
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    article.source.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
          ),
          SizedBox(
            height: 8.0,
          ),
         

          
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          
          ),
         SizedBox(
            height: 8.0,
          ),
          Text(
            article.publishedAt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),

          ),
        ],
      ),
    ),
  );
}