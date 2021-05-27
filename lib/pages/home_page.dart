import 'package:flutter/material.dart';
import 'package:learning_flutter/models/catalog.dart';
import 'package:learning_flutter/widgets/drawer.dart';
import 'package:learning_flutter/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Saeed";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog Bar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          //itemCount: CatalogModel.items.length, //no of items
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            //how to show the items
            //return ItemWidget(item: CatalogModel.items[index]);
            return ItemWidget(item: dummyList[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
