import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

DatabaseReference getRef() {
  final ref = FirebaseDatabase.instance.reference().child('categories');
  return ref;
}

Future create(name) {
  return getRef().child(Uuid().v4()).set({
    'name': name
  });
}

Future all() {
  return getRef().once();
}
