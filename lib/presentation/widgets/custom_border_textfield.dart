import 'package:flutter/material.dart';

//textfields custom border
OutlineInputBorder customBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: color));
}
