import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proapi/Model/model.dart';
import 'package:proapi/Services/servuces.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GetViewMode = Provider.of<Getapi>(context);

    //print(authViewMode.getUserApi());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Get Api Using Provider'),
      ),
      body: Column(
        children: [
          Consumer<Getapi>(builder: (context, value, child) {
            return
                //  Text(value.getUserApi().toString());
                Expanded(
              child: FutureBuilder(
                future: value.getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: Getapi.userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusbaleRow(
                                      title: 'Name',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  ReusbaleRow(
                                      title: 'username',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  ReusbaleRow(
                                      title: 'email',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  ReusbaleRow(
                                      title: 'Address',
                                      value: snapshot
                                          .data![index].address!.geo!.lat
                                          .toString())
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            );
          })

          //  Text()
          // Expanded(
          //   child: FutureBuilder(
          //     future: ,
          //     builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          //       if (!snapshot.hasData) {
          //         return CircularProgressIndicator();
          //       } else {
          //         return ListView.builder(
          //             itemCount: Getapi.userList.length,
          //             itemBuilder: (context, index) {
          //               return Card(
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Column(
          //                     children: [
          //                       ReusbaleRow(
          //                           title: 'Name',
          //                           value:
          //                               snapshot.data![index].name.toString()),
          //                       ReusbaleRow(
          //                           title: 'username',
          //                           value: snapshot.data![index].username
          //                               .toString()),
          //                       ReusbaleRow(
          //                           title: 'email',
          //                           value:
          //                               snapshot.data![index].email.toString()),
          //                       ReusbaleRow(
          //                           title: 'Address',
          //                           value: snapshot
          //                               .data![index].address!.geo!.lat
          //                               .toString())
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             });
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String title, value;
  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
