import 'dart:convert';

import 'package:flutter/material.dart';

 import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

 class ExamplePage extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
 // final formKey = new GlobalKey<FormState>();
 // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  // var  names = <int>[];
  //var  names = new List();
 // List<Widget> names = [];
 List<dynamic> names = [];
  List<dynamic> filteredNames =[];

 // List<Widget> filteredNames = [];
   //var  filteredNames = <int>[];
  Icon _searchIcon = new Icon(Icons.search);
  // ignore: unused_field
  Widget _appBarTitle = new Text( 'Search Example' );

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    //this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
    //appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildList() {
    // ignore: prefer_is_not_empty
    if (!(_searchText.isEmpty)) {
      List<dynamic> tempList = [];
      for (dynamic i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Example' );
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _getNames()async {
     final  response = await dio.get('https://swapi.co/api/people');

    List<String> tempList = [];
    //dynamic i='';
    for (dynamic i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }

}

// class searchPage extends StatefulWidget {
//   const searchPage({Key? key}) : super(key: key);

//   @override
//   _searchPageState createState() => _searchPageState();
// }

// class _searchPageState extends State<searchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search'),
//       ),
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [Text('Search to')],
//           ),
//         ),
//       ),
//     );
//   }
// }
