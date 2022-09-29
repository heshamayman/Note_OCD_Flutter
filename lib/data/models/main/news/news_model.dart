

import 'package:flutter/material.dart';

class NewsModel {
  String? code;
  String? message;
  List<NewsDataModel> news = [];

NewsModel.fromJson(Map<String,dynamic> json){
  code = json['code'];
  message = json['message'];
  for(Map<String,dynamic> json in json['data'])
    {
      news.add(NewsDataModel.fromJson(json));
    }
}
}

class NewsDataModel {
  int? id;
  String? date;
  String? body;
  NetworkImage? image;
  String? linkUrl;
  String? title;


  NewsDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    date = json['date'];
    body = json['body'];
    image = json['imageUrl'];
    linkUrl = json['linkUrl'];
    title = json['title'];
  }


}