import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proapi/Dropdown/dropdwon.dart';
import 'package:proapi/Services/servuces.dart';
import 'package:proapi/Views/Product_Api.dart';
import 'package:provider/provider.dart';

class PhotiapiScreen extends StatefulWidget {
  const PhotiapiScreen({Key? key}) : super(key: key);

  @override
  _PhotiapiScreenState createState() => _PhotiapiScreenState();
}

class _PhotiapiScreenState extends State<PhotiapiScreen> {
  @override
  Widget build(BuildContext context) {
    final GetViewMode = Provider.of<ServiceApi>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Photo + Text List'),
      ),
      body: Column(
        children: [
          Consumer<ServiceApi>(
            builder: (context, value, child) {
              return Expanded(
                child: FutureBuilder(
                    future: value.getPhotos(),
                    builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                      return ListView.builder(
                          itemCount: ServiceApi.photosList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![index].url.toString()),
                              ),
                              subtitle:
                                  Text(snapshot.data![index].title.toString()),
                              title: Text('Notes id:' +
                                  snapshot.data![index].id.toString()),
                            );
                          });
                    }),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DropDownApi()),
                );
              },
              child: Text('Dropdwon Api'))
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}
