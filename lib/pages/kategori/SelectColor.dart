import 'package:flutter/material.dart';
import 'package:bakul/widgets/flutter_hsvcolor_picker.dart';

class SelectColor extends StatefulWidget {
  SelectColor({this.onChange});

  var onChange;

  _SelectColorState createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  @override
  Widget build(BuildContext context) {
    return SwatchesPicker(
      onChanged: widget.onChange,
    );
  }
}
