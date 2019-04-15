import 'package:flutter/material.dart';

class CardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Cards Poligon",
        theme: ThemeData(primarySwatch: Colors.red),
        home: CardsPage(),
      );
}

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("KARTY"),
        ),
        body: CardsPanel(LocalItemsStore()),
      );
}

class CardsPanel extends StatefulWidget {
  final ItemsStore _store;

  CardsPanel(this._store);

  @override
  _CardsPanelState createState() => _CardsPanelState();
}

class _CardsPanelState extends State<CardsPanel> {

  _itemBusinessFilter(MyItem item) => item.id % 4 == 0;

  List<Widget> _buildCards() => widget._store
      .items()
      .map((item) => ExpansionTile(
            key: Key("card${item.id}"),
            initiallyExpanded: _itemBusinessFilter(item),
            leading: Icon(Icons.arrow_downward),
            title: Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
            children: <Widget>[
              Text(item.content),
              Container(alignment: Alignment.centerRight, child: IconButton(icon: Icon(Icons.link), onPressed: () {}))
            ],
          ))
      .toList();

  @override
  Widget build(BuildContext context) => ListView(
        children: _buildCards(),
      );
}

abstract class ItemsStore {
  Iterable<MyItem> items();
}

class LocalItemsStore implements ItemsStore {
  Iterable<MyItem> items()  =>
      Iterable<int>.generate(10).map((i) => MyItem(i,"item$i", List.filled(5, "lorem ipsum $i ").join()));
}

class MyItem {
  final int id;
  final String title;
  final String content;

  MyItem(this.id,this.title, this.content);
}
