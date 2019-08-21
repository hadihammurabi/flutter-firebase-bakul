import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  String title;

  ItemList({this.title});

  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
