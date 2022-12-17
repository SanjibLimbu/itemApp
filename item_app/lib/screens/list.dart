class ListClass{
  List<Map> _itemList=[];

  void addItem(String name, int quantity, int rate) {
    _itemList.add({
      "name": name,
      'quantity': quantity,
      "rate": rate,
    });
  }

  List<Map> getItem() {
    return _itemList;
  }

}