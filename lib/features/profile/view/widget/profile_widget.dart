import 'package:category/features/profile/model/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final   model;
  const ProfileWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo.shade100),
                  child:  Text(model.toString()),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 25,
              );
            },
            itemCount: 4,
          ),
        )
      ],
    );
  }
}
