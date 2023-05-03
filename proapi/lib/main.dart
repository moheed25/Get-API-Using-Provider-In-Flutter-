import 'package:flutter/material.dart';
import 'package:proapi/HomePage.dart';
import 'package:proapi/Services/servuces.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Getapi(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()
          // initialRoute: RoutesName.splash,
          // onGenerateRoute: Routes.generateRoute,
          ),
    );
  }
}
