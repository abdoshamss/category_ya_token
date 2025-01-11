import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final String name;
  final int index;
  final IconData icon;

  final void Function()? onTap;

  const HomeContainer(
      {super.key, this.onTap, required this.name, required this.index, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff020122 * index)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                icon,
                size: 35,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
