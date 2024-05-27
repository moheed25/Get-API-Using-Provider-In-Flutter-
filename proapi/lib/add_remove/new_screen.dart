import 'package:flutter/material.dart';
import 'package:proapi/add_remove/notifier.dart';
import 'package:provider/provider.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<ItemProvider>().fav_List;
    print(fav);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ItemProvider>().deleteAllList();
                },
                icon: Icon(
                  Icons.remove,
                  color: Colors.grey,
                ))
          ],
        ),
        body: Column(
          children: [
            fav.isEmpty
                ? Center(
                    child: Text('Nothing to show anything'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: fav.length,
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
                                  leading: IconButton(
                                      onPressed: () {
                                        context
                                            .read<ItemProvider>()
                                            .removeTolist(index);
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.grey,
                                      )),
                                  title: Text(index.toString()),
                                  trailing: Icon(Icons.favorite_outline,
                                      color: Colors.red)),
                            ),
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
