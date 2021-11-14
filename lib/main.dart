import 'package:flutter/material.dart';
import 'package:procurement_management_system_web_frontend/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Procurement Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      // darkTheme: ThemeData(
      //     brightness: Brightness.dark, primarySwatch: Colors.deepPurple),
      home: Home()
    );
  }
}
