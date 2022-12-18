import 'package:flutter/material.dart';
import 'package:item_app/screens/home.dart';

void main() {
  runApp(const ItemApp());
}

class ItemApp extends StatelessWidget {
  const ItemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
