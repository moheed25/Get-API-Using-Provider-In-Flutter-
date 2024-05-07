import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proapi/Model/model.dart';
import 'package:proapi/Model/post_model.dart';
import 'package:proapi/Views/Photo_api.dart';
import 'package:provider/provider.dart';
var data;
class ServiceApi extends ChangeNotifier {
  static List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
  static List<PostsModel> postList = [] ;

  Future<List<PostsModel>> getPostApi ()async{
    final resposne = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')) ;
    var data = jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList ;
    }else {
      return postList ;
    }
  }
   static List<Photos> photosList = [];
  
  Future<List<Photos>> getPhotos ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos')) ;
    var data = jsonDecode(response.body.toString());

    print(data);
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url'] , id: i['id']);
        photosList.add(photos);
      }
      return photosList ;
    }else {
      return photosList ;
    }
  }

}
