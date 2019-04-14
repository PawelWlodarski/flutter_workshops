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
        body: CardsPanel(ItemsStore()),
      );
}

class CardsPanel extends StatefulWidget {
  final ItemsStore _store;

  CardsPanel(this._store);

  @override
  _CardsPanelState createState() => _CardsPanelState();
}

class _CardsPanelState extends State<CardsPanel> {
  List<Widget> _buildCards() => widget._store.items
      .map((item) => ExpansionTile(
            title:
                Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
            children: <Widget>[
              Text(item.content),
              Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.link),
                    onPressed: () {},
                  ))
            ],
          ))
      .toList();

  @override
  Widget build(BuildContext context) => ListView(
        children: _buildCards(),
      );
}

class ItemsStore {
  final items = Iterable<int>.generate(10)
      .map((i) => _MyItem("item$i", List.filled(5, "lorem ipsum $i ").join()));
}

class _MyItem {
  final String title;
  final String content;

  _MyItem(this.title, this.content);
}
