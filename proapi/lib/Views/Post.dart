import 'package:flutter/material.dart';
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proapi/Dropdown/dropdwon.dart';
import 'package:proapi/Model/post_model.dart';
import 'package:proapi/Services/servuces.dart';
import 'package:proapi/Views/Photo_api.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
   PostScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
        final GetViewMode = Provider.of<ServiceApi>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post List'),
      ),
      body: Column(
        children: [
          Consumer<ServiceApi>(
            builder: (context , value , child){
              return Expanded(
              child: FutureBuilder(
                future: value.getPostApi(),
                builder: (context , snapshot){
                  if(!snapshot.hasData){
                    return Text('Loading');
                  }else {
                    return ListView.builder(
                        itemCount: ServiceApi.postList.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
            
                                  Text('Title' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                  SizedBox(height: 3,),
                                  Text(snapshot.data![index].title.toString()),
                                  SizedBox(height: 5,),
                                  Text('Description' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                  SizedBox(height: 3,),
                                  Text('Description\n'+snapshot.data![index].body.toString() , style: Theme.of(context).textTheme.bodyText1)
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),);
            },
          
            ),
        
                    ElevatedButton(onPressed: (){
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>PhotiapiScreen ()),
  );
          }, child: Text('Photo Api'))
        ],
      ),
    );
  }
}