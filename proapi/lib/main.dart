import 'package:flutter/material.dart';
import 'package:proapi/HomePage.dart';
import 'package:proapi/Services/servuces.dart';
import 'package:proapi/get_provider/TodoProvider/todo_provider.dart';
import 'package:proapi/get_provider/TodoView/todo_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TodoProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceApi(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TodoView()
          // initialRoute: RoutesName.splash,
          // onGenerateRoute: Routes.generateRoute,
          ),
    );
  }
}
