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
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                          header: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.deepPurple),
                          ),
                          footer: Container(
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                          child: Image.network(item.image)));
                },
                itemCount: CatalogModel.items.length,
              )
            // ? ListView.builder(
            //     //itemCount: CatalogModel.items.length, //no of items
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) {
            //       //how to show the items
            //       //return ItemWidget(item: CatalogModel.items[index]);
            //       return ItemWidget(item: CatalogModel.items[index]);
            //     },
            // )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
