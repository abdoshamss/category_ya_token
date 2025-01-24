import 'package:category/features/cart/fav/cubit/fav_cubit.dart';
import 'package:category/features/cart/fav/cubit/fav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_bar.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Favorite",
          icon: Icons.arrow_back_ios,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: BlocProvider(
        create: (context) => FavCubit()..getFavCubit(),
        child: BlocBuilder<FavCubit, FavState>(builder: (context, state) {
          if (state is FavAddSuccessState) {
            if (state.list.isEmpty) {
              return const Center(
                child: Text(
                  'your fav is currently empty',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return ListView.separated(
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(blurRadius: 7, color: Colors.black)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                height: 120,
                                width: 120,
                                child: Image(
                                    fit: BoxFit.fitWidth,
                                    image:
                                        NetworkImage(state.list[index].image)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.list[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$${state.list[index].price}".toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  FavCubit.get(context)
                                      .deleteFavCubit(id: state.list[index].id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        "item successfully deleted",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      )),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: state.list.length);
            }
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
