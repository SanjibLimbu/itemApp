import 'package:flutter/material.dart';
import 'package:item_app/screens/list.dart';

class ListItemView extends StatefulWidget {
  const ListItemView({super.key});

  @override
  State<ListItemView> createState() => _ListItemViewState();
}

class _ListItemViewState extends State<ListItemView> {
  late List<Map> itemList;
  @override
  void initState() {
    super.initState();
    itemList = ListClass.instance.items;
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
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(itemList[index]['name']),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      itemList.removeAt(index);
                      setState(() {
                        
                      });
                    },
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rate: ${itemList[index]['rate']}"),
                      Text("Quantity ${itemList[index]['quantity']}"),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
