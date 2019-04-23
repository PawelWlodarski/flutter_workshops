abstract class ItemsStore {
  Iterable<MyItem> items();
}

class LocalItemsStore implements ItemsStore {
  Iterable<MyItem> items() =>
      Iterable<int>.generate(10).map((i) => MyItem(i, "item$i", List.filled(5, "lorem ipsum $i ").join()));
}

class MyItem {
  final int id;
  final String title;
  final String content;

  MyItem(this.id, this.title, this.content);
}