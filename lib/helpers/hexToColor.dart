import 'package:flutter/material.dart';

Color hexToColor(String color) {
  return Color(int.parse(color, radix: 16) + 0xFF000000);
}