import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshops/poligon/cards_app.dart';

void main() {


  group("cards widgets", () {

    testWidgets("hidden card has arrow downward", (tester) async {
      final item = MyItem(1, "title", "content");
      final expandedCard = _buildWidget(item, false);

      await tester.pumpWidget(expandedCard);

      expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
      expect(find.byIcon(Icons.arrow_upward), findsNothing);
    });

    testWidgets("expanded card has arrow upward", (tester) async {
      final item = MyItem(1, "title", "content");
      final expandedCard = _buildWidget(item, true);

      await tester.pumpWidget(expandedCard);

      expect(find.byIcon(Icons.arrow_downward), findsNothing);
      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    });

    testWidgets("tapping card changes icon", (tester) async {
      final item = MyItem(1, "title", "content");
      final expandedCard = _buildWidget(item, false);

      await tester.pumpWidget(expandedCard);

      await tester.tap(find.byType(ItemTile));
      await tester.pump();

      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);

      await tester.tap(find.byType(ItemTile));
      await tester.pump();

      expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
    });
  });
}

_buildWidget(MyItem i, bool isExpanded) => MaterialApp(

      home: Scaffold(
        body: ListView(
          children: <Widget>[ItemTile(i,isExpanded)],
        )
      ),
    );
