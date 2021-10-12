
import 'package:bbcnews/pages/Home.dart';
import 'package:bbcnews/pages/Login.dart';
import 'package:bbcnews/pages/favourite.dart';
import 'package:bbcnews/pages/profile.dart';
import 'package:bbcnews/pages/register.dart';
import 'package:bbcnews/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bbcnews/services/api_service.dart';
import 'package:bbcnews/model/article_model.dart';

import 'components/customListTile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
            
            home: login(),
            routes: {
              "/login" :(context)=>login(),
              "/Register":(context)=>singup(),
              "/home":(context)=>homepage(),
             // "/Search":(context)=>searchPage(),
              "/Favourite":(context)=>favouritePage(),
             // "/Profile":(context)=>profilePage()
             "/search":(context)=>ExamplePage(),
            },
           
            
            );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}



