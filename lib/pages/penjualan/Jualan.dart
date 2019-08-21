import 'package:bakul/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class Jualan extends StatefulWidget {
  _JualanState createState() => _JualanState();
}

class _JualanState extends State<Jualan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      drawer: AppDrawer(),
    );
  }
}
