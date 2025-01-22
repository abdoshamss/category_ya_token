import 'package:category/core/widget/app_bar.dart';
import 'package:category/core/widget/drawer_widget.dart';
import 'package:category/features/cart/cubit/cart_cubit.dart';
import 'package:category/features/cart/cubit/cart_state.dart';
import 'package:category/features/cart/view/widget/cart_body.dart';
import 'package:category/features/shared/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartScreen extends StatelessWidget {


  const CartScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => CartCubit()..getDataCunit(),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartSuccessState) {
                return Scaffold(
                  endDrawer: const DrawerWidget(),
                  appBar: appBar(title: "LapTops"),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                              child: CustomCart(model: state.list[index])
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 25,
                            );
                          },
                          itemCount: state.list.length,
                        ),
                      )
                    ],
                  ),
                );
              }
              return const Loading();
            },
          )),
    );
  }
}
