import 'package:category/features/profile/cubit/profile_cubit.dart';
import 'package:category/features/profile/cubit/profile_state.dart';
import 'package:category/features/profile/view/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("profile"),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit()..getProfileCubit(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
          if (state is ProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text("success"),
            ));
          }
        }, builder: (context, state) {
          if (state is ProfileSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state
                        .profileModelUserData.profileUserModel.profileImage),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Name : ",
                            style: TextStyle(
                              color: Colors.red,
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              state.profileModelUserData.profileUserModel.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Email : ",
                            style: TextStyle(
                              color: Colors.red,
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              state.profileModelUserData.profileUserModel.email,style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Phone : ",
                            style: TextStyle(color: Colors.red,
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              state.profileModelUserData.profileUserModel.phone,style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "National ID : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red),
                          ),
                          Text(
                              state.profileModelUserData.profileUserModel.nationalId,style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Text("error");
        }),
      ),
    );
  }
}
