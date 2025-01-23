import 'package:category/core/widget/app_bar.dart';
import 'package:category/features/cart/add_cart/cubit/add_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/add_cart/cubit/add_cubit.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Cart",
          icon: Icons.arrow_back_ios,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: BlocProvider(
        create: (context) => AddCubit()..getAllCubit(),
        child: BlocBuilder<AddCubit, AddState>(
          builder: (context, state) {
            if (state is AddAllSuccessState) {
              if (state.list.isEmpty) {
                return const Center(
                  child: Text(
                    'your cart is currently empty',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) =>
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                  height: 150,
                                  width: 360,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 7, color: Colors.black)
                                      ]),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.grey),
                                            height: 110,
                                            width: 110,
                                            child: Image(
                                                fit: BoxFit.fitWidth,
                                                image: NetworkImage(
                                                    state.list[index].image)),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              "\$${state.list[index].price}"
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.orange),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              AddCubit.get(context)
                                                  .deleteAllCubit(
                                                  id: state.list[index].id);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                    "item successfully deleted",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  duration: Duration(
                                                      seconds: 2),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.remove_shopping_cart,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.list.length);
              }

            }return const Center(child: CircularProgressIndicator());
          }),
      ),
    );
  }
}
