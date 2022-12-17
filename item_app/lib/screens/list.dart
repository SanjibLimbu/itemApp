class ListClass {
  ListClass._();
  static final ListClass instance = ListClass._();

  final List<Map> _itemList = [];

  void addItem(String name, int quantity, int rate) {
    _itemList.add({
      "name": name,
      'quantity': quantity,
      "rate": rate,
    });
  }

  List<Map> get items => _itemList;
}
