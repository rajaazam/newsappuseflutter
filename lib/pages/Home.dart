import 'package:bbcnews/pages/Headlines.dart';
import 'package:bbcnews/pages/PopularNews.dart';
import 'package:bbcnews/pages/SportNews.dart';
import 'package:bbcnews/pages/TopStories.dart';
import 'package:bbcnews/pages/profile.dart';
import 'package:bbcnews/pages/vedioScreenMain.dart';
//import 'package:bbcnews/pages/vediopage.dart';
//import 'package:bbcnews/pages/vediopageScreenMain.dart';
import 'package:bbcnews/services/api_service.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 5,
          child: Scaffold(
            //backgroundColor: Colors.black,
            appBar: AppBar(
             title: Center(child: Text('B B C NEWS',style: TextStyle(color: Colors.white),),),
                backgroundColor: Colors.red,
                // elevation: 0,
                // brightness: Brightness.light,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/search");
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                    // alignment: Alignment.bottomLeft,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/Favourite");
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.white,
                      ))
                ],
                // leading:Actions(actions: actions, child: child) ,

                bottom: TabBar(
                  isScrollable: true,
                  indicatorWeight: 7, indicatorColor: Colors.white,

                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //indicator: BoxDecoration(
                  //borderRadius: BorderRadius.circular(50), // Creates border
                  // color: Colors.white),
                  tabs: [
                    Tab(
                      text: 'Top Stories',
                    ),
                    Tab(
                      text: 'HeadLines',
                    ),
                    
                    Tab(text: 'Videos',),
                    Tab(
                      text: 'Popular News',
                    ),
                    Tab(
                      text: 'Sport News',
                    ),
                  ],
                )),
            drawer: profilePage(),
            body: SafeArea(
              child: Container(
                child: TabBarView(
                  children: [
                    TopstoriesPage(),
                    headlinesPages(),
                    HomeScreen(),
                    PopularnewsPage(),
                    SportPage(),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
