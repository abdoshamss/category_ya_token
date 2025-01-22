import 'package:flutter/material.dart';

AppBar appBar({required title,IconData? icon,void Function()? onPressed}) {
  return AppBar(
    leading: IconButton( onPressed: onPressed, icon: Icon(icon),),
    toolbarHeight: 70,
    backgroundColor: Colors.red.shade200,
    title: Text(title),
    centerTitle: true,
    titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 30, color: Colors.brown),
  );
}
