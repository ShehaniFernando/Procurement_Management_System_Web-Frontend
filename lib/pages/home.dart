import 'package:flutter/material.dart';
import 'package:procurement_management_system_web_frontend/widgets/procurement_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProcurementDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to Procurement Management System'),
      ),
    );
  }
}
