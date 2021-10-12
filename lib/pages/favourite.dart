import 'dart:io';

import 'package:bbcnews/components/customListTile.dart';
import 'package:bbcnews/model/article_model.dart';
import 'package:bbcnews/services/api_services_favourite.dart';
import 'package:flutter/material.dart';

class favouritePage extends StatefulWidget {
  const favouritePage({ Key? key }) : super(key: key);

  @override
  _favouritePageState createState() => _favouritePageState();
}

class _favouritePageState extends State<favouritePage> {
   ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Save news", style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_sharp),
        color: Colors.black,
        )
        
    //  actions: [

    //     //  IconButton(
    //     //               onPressed: () {
    //     //                 Navigator.pushNamed(context, "/login");
    //     //               },
    //     //               icon: Icon(
    //     //                 Icons.arrow_back_sharp,
                        
    //     //                 size: 30,
    //     //                 color: Colors.black,
    //     //               ),
    //     //               alignment: Alignment.bottomLeft
    //     //               ),
    //                   Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child:
    //         IconButton(onPressed: (){
    //           Navigator.pushNamed(context, '/login');
    //         }, icon: Icon(
    //                     Icons.arrow_back_sharp,
                        
    //                     size: 30,
    //                     color: Colors.black,
    //                   ),
    //                   )
    //       )
        
    //   ],
     
     
     
       
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
  
