import 'package:flutter/material.dart';
import 'package:proapi/add_remove/new_screen.dart';
import 'package:proapi/add_remove/notifier.dart';
import 'package:provider/provider.dart';

class MyItemsList extends StatelessWidget {
  const MyItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<ItemProvider>().fav_List;
    print(fav);
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text("Hello"),
                      trailing: IconButton(
                          onPressed: () {
                            if (!fav.contains(index)) {
                              context.read<ItemProvider>().addTolist(index);
                              print(fav);
                            } else {
                              context.read<ItemProvider>().removeTolist(index);
                            }
                          },
                          icon: Icon(
                            Icons.favorite_outline,
                            color:
                                fav.contains(index) ? Colors.red : Colors.grey,
                          )),
                    ),
                  ),
                );
              }),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => New()),
                );
              },
              child: Text('Next'))
        ],
      ),
    );
  }
}
