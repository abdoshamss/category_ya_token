import 'package:flutter/material.dart';

AppBar appBar(
    {required title,
    IconData? icon,
    IconData? arrowIcon,
    void Function()? onPressedArrow,
    void Function()? onPressed,
    IconData? icon1,
    void Function()? onPressed1}) {
  return AppBar(
    leadingWidth: 100,
    actions: [if (icon1 != null)
      IconButton(
          onPressed: onPressed1,
          icon: Row(
            children: [
              Icon(
                icon1,
                color: Colors.red.shade200,
              )
            ],
          ))
    ],
    iconTheme: IconThemeData(color: Colors.red.shade200),
    leading: Row(
      children: [if (icon1 != null)
        IconButton(
          onPressed: onPressedArrow,
          icon: Icon(
            arrowIcon,
            color: Colors.red.shade200,
            size: 30,
          ),

        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.red.shade200,
            size: 30,
          ),

        ),
      ],
    ),
    toolbarHeight: 70,
    backgroundColor: Colors.indigo,
    title: Text(title),
    centerTitle: true,
    titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
  );
}
