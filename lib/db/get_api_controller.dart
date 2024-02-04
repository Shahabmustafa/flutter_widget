import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/comments_model.dart';

class GetApiController{

  List<Comment> comment = [];


  Future<List<Comment>> fetchData()async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        for(var data in json){
          Comment model = Comment.fromJson(data);
          comment.add(model);
        }
      }return comment;
    }on SocketException{
      throw Exception("Show Error");
    }on TimeoutException{
      throw Exception("Show Error");
    }
  }
}