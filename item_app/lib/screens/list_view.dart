import 'package:flutter/material.dart';
import 'package:item_app/screens/list.dart';

class ListItemView extends StatefulWidget {
  const ListItemView({super.key});

  @override
  State<ListItemView> createState() => _ListItemViewState();
}

class _ListItemViewState extends State<ListItemView> {
  var itemList;
  @override
  void initState() {
    super.initState();
    var itemList = ListClass().getItem;

    print(" itemList ${itemList}");
  }

  @override
  Widget build(BuildContext context) {
    return itemList.isEmpty
        ? const Center(
            child: Text(
              "Item list is empty",
            ),
          )
        : ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(itemList[index]['name']),
                subtitle: Column(
                  children: [
                    Text("Rate: ${itemList[index]['rate']}"),
                    Text("Quantity ${itemList[index]['quantity']}"),
                  ],
                ),
              );
            },
          );
  }
}
