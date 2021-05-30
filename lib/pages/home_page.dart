import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:learning_flutter/models/catalog.dart';
import 'package:learning_flutter/widgets/drawer.dart';
import 'package:learning_flutter/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Saeed";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    //This will convert the dynamic we get from json decode in catalog.dart
    // to some objects of our own
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item)) //This line
        .toList();
    //will call Item.fromMap to convert each map into a object of Item
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(5, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog Bar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                //itemCount: CatalogModel.items.length, //no of items
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  //how to show the items
                  //return ItemWidget(item: CatalogModel.items[index]);
                  return ItemWidget(item: CatalogModel.items[index]);
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
