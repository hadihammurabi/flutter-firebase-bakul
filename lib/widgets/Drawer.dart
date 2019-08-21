import 'package:bakul/pages/kategori/KategoriList.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List menu = [
    {
      'title': 'Kategori',
      'page': KategoriList(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: double.infinity,
            padding: EdgeInsets.only(top: 30.0, bottom: 10),
            child: Center(
                child: Text(
              'Bakul',
              style: TextStyle(fontSize: 35.0, color: Colors.white),
            )),
          ),
          Column(
            children: List.generate(menu.length, (index) {
              return ListTile(
                title: Text(menu[index]['title']),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (c) => menu[index]['page'])),
              );
            }),
          ),
        ],
      ),
    );
  }
}
