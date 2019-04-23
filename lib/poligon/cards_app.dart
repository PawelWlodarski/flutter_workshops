import 'package:flutter/material.dart';
import 'package:flutter_workshops/poligon/item_details.dart';
import 'package:flutter_workshops/poligon/items.dart';

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

  List<Widget> _buildCards() => widget._store.items().map((item) {
        final isExpanded = _itemBusinessFilter(item);
        return ItemTile(item,isExpanded);
      }).toList();

  @override
  Widget build(BuildContext context) => ListView(
        children: _buildCards(),
      );
}

class ItemTile extends StatefulWidget{

  final MyItem _item;
  final bool _isExpanded;

  ItemTile(this._item, this._isExpanded) : super();

  @override
  _ItemTileState createState() => _ItemTileState(_isExpanded);
}

class _ItemTileState extends State<ItemTile> {

  bool _isExpanded;

  _ItemTileState(bool isExpanded){
    this._isExpanded = isExpanded;
  }

  _itemIcon() => this._isExpanded ? Icon(Icons.arrow_upward) : Icon(Icons.arrow_downward);

  @override
  Widget build(BuildContext context) => ExpansionTile(
    initiallyExpanded: widget._isExpanded,
    leading: _itemIcon(),
    onExpansionChanged: (isExpanding){ //TODO extract method
        setState((){this._isExpanded = isExpanding;});
    },
    title: Text(widget._item.title, style: TextStyle(fontWeight: FontWeight.bold)),
    children: <Widget>[
      Text(widget._item.content),
      Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.link),
            onPressed: () { //TODO extract method
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => ItemDetails(widget._item)));
            },
          ))
    ],
  );
}