//declare packages
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_news/main.dart';
import 'package:tugasakhir_news/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_news/components/customListTile.dart';
import 'package:tugasakhir_news/model/article_model.dart';
import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class Search extends StatefulWidget {
  Search() : super();

  @override
  SearchState createState() => SearchState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class SearchState extends State<Search> {
  final _debouncer = Debouncer();

  // List<Subject> ulist = [];
  // List<Subject> userLists = [];
  // //API call for All Subject List

  // final String endPointUrl =
  //     "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dca51ddc2f3e42a8953264d04a0ecaad";

  // Future<List<Article>> getArticle() async {
  //   var res = await http.get(Uri.parse(endPointUrl));

  //   if (res.statusCode == 200) {
  //     Map<String, dynamic> json = jsonDecode(res.body);

  //     List<dynamic> body = json['articles'];

  //     List<Article> articles =
  //         body.map((dynamic item) => Article.fromJson(item)).toList();

  //        return articles;
  //   } else {
  //     throw ("Can't get the Articles");
  //   }
  // }
  
  

  // static List<Subject> parseAgents(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getArticle().then((subjectFromServer) {
  //     setState(() {
  //       ulist = subjectFromServer.cast<Subject>();
  //       userLists = ulist;
  //     });
  //   });
  // }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search stil progress", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      
      // body: Column(
      //   children: <Widget>[
         
      //     Container(
      //       padding: EdgeInsets.all(15),
      //       child: TextField(
      //         textInputAction: TextInputAction.search,
      //         decoration: InputDecoration(
      //           enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(25.0),
      //             borderSide: BorderSide(
      //               color: Colors.grey,
      //             ),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20.0),
      //             borderSide: BorderSide(
      //               color: Colors.blue,
      //             ),
      //           ),
      //           suffixIcon: InkWell(
      //             child: Icon(Icons.search),
      //           ),
      //           contentPadding: EdgeInsets.all(15.0),
      //           hintText: 'Search ',
      //         ),
      //         onChanged: (string) {
      //           _debouncer.run(() {
      //             setState(() {
      //               userLists = ulist
      //                   .where(
      //                     (u) => (u.description.toLowerCase().contains(
      //                           string.toLowerCase(),
      //                         )),
      //                   )
      //                   .toList();
      //             });
      //           });
      //         },
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         shrinkWrap: true,
      //         physics: ClampingScrollPhysics(),
      //         padding: EdgeInsets.all(5),
      //         itemCount: userLists.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Card(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               side: BorderSide(
      //                 color: Colors.grey.shade300,
      //               ),
      //             ),
      //             child: Padding(
      //               padding: EdgeInsets.all(5.0),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   ListTile(
      //                     title: Text(
      //                       userLists[index].description,
      //                       style: TextStyle(fontSize: 16),
      //                     ),
      //                     subtitle: Text(
      //                       userLists[index].author ?? "null",
      //                       style: TextStyle(fontSize: 16),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

 
// class Subject {
//   var description;
//   var author;
//   Subject({
//     required this.description,
//     required this.author,
//   });

//   factory Subject.fromJson(Map<dynamic, dynamic> json) {
//     return Subject(
//       description : json['description'],
//       author: json['author'],
//     );
//   }
// }