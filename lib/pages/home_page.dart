import 'package:flutter/material.dart';
import 'package:learning_flutter/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Saeed";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog Bar"),
      ),
      body: Center(
        child: Container(
          child: Text("Learning Flutter in $days days by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
