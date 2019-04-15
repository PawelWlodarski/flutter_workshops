
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshops/poligon/cards_app.dart';

void main() {
  _buildPanel(ItemsStore store) => MaterialApp(
          home: Scaffold(
        body: CardsPanel(store),
      ));

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(_buildPanel(_ItemsStoreMock()));

    expect(find.text('title1'), findsOneWidget);
    expect(find.text('content1'), findsNothing);
    expect(find.text('content4'), findsOneWidget);
//
    await tester.tap(find.byKey(Key("card1")));
    await tester.pump();
//
    expect(find.text('content1'), findsOneWidget);
  });

}

class _ItemsStoreMock implements ItemsStore{
  @override
  Iterable<MyItem> items()  => [
    MyItem(1,"title1","content1"),
    MyItem(2,"title2","content2"),
    MyItem(3,"title3","content3"),
    MyItem(4,"title4","content4"),
  ];



}