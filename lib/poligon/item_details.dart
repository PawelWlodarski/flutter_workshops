import 'package:flutter/material.dart';
import 'package:flutter_workshops/poligon/items.dart';

class ItemDetails extends StatelessWidget {

  final MyItem item;

  const ItemDetails(this.item) : super();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Item Details"),),
    body: Column(
      children: <Widget>[
        Text(item.id.toString()),
        Text(item.title),
        Text(item.content),
      ],
    ) ,
  );
}
