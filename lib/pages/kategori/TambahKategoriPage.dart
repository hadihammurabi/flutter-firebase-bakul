import 'package:flutter/material.dart';

import 'package:bakul/services/kategori.dart' as kategoriService;

class TambahKategori extends StatefulWidget {
  _TambahKategoriState createState() => _TambahKategoriState();
}

class _TambahKategoriState extends State<TambahKategori> {
  String kategori;
  String color;

  @override
  void initState() {
    super.initState();
    setState(() {
      kategori = "";
      color = '000000ff';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Kategori')),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Nama Kategori'),
                onChanged: (kat) {
                  setState(() {
                    kategori = kat;
                  });
                },
              ),
              SizedBox(height: 30.0),
              ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Tambah'),
                  onPressed: () {
                    kategoriService.create(kategori).then((val) {
                      Navigator.pop(context);
                    }).catchError((error) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Gagal menambah kategori.'),
                      ));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
