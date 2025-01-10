import 'package:flutter/material.dart';

import '../model/category_model.dart';

class HomeContainer extends StatelessWidget {

  final void Function()? onTap;
  const HomeContainer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.indigo.shade300),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                "Electronics",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.tv, size: 35, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
