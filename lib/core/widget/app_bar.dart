import 'package:flutter/material.dart';

AppBar appBar({required title}) {
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: Colors.red.shade200,
    title: Text(title),
    centerTitle: true,
    titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 30, color: Colors.brown),
  );
}
