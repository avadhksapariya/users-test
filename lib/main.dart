import 'package:flutter/material.dart';
import 'package:users_test/my_home_page.dart';
import 'package:users_test/rest_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Test',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(title: 'Users Test', futureUsers: RESTUser().getUserList()),
    );
  }
}
