import 'dart:convert';
import 'package:tugasakhir_news/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiService {

  final String endPointUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dca51ddc2f3e42a8953264d04a0ecaad";

  Future<List<Article>> getArticle() async {
    var res = await http.get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

         return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
