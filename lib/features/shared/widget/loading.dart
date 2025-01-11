import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';


class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FadeInLeft(child: const Square()),
              FadeInUp(child: const Square()),
              FadeInDown(child: const Square()),
              FadeInRight(child: const Square()),
            ],
          ),
        ),
    );
  }
}

class Square extends StatelessWidget {
  const Square({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blueAccent,
    );
  }
}