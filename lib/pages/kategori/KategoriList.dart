import 'package:bakul/helpers/hexToColor.dart';
import 'package:flutter/material.dart';
import 'package:bakul/services/kategori.dart' as kategoriService;
import 'package:bakul/pages/item/ItemList.dart';
import 'package:bakul/pages/kategori/TambahKategoriPage.dart';

class KategoriList extends StatefulWidget {
  KategoriList({Key key}) : super(key: key);

  _KategoriListState createState() => _KategoriListState();
}

class _KategoriListState extends State<KategoriList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: StreamBuilder(
        stream: kategoriService.getRef().onValue,
        builder: (ctx, db) {
          if (db.hasData && !db.hasError) {
            final snapshot = db.data.snapshot;

            if (snapshot.value != null && snapshot.value.length > 0) {
              List categories = [];

              snapshot.value.keys.forEach((key) {
                categories.add({
                  'id': key,
                  'name': snapshot.value[key]['name'],
                });
              });

              return GridView.count(
                crossAxisCount: 3,
                children: List.generate(categories.length, (index) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.expand(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          categories[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (c) => ItemList(
                                    title: categories[index]['name']))),
                      ),
                    ),
                  );
                }),
              );
            } else {
              return Text('gak ada');
            }
          }

          return Text('gak ada');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (c) => TambahKategori())),
        tooltip: 'Tambah Kategori',
        child: Icon(Icons.add),
      ),
    );
  }
}
