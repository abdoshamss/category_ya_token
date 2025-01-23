import 'package:category/core/widget/app_bar.dart';
import 'package:category/core/widget/drawer_widget.dart';
import 'package:category/features/all_prodduct/view/all_product_screen.dart';
import 'package:category/features/cart/cubit/cart_cubit.dart';
import 'package:category/features/cart/cubit/cart_state.dart';
import 'package:category/features/cart/fav/view/fav_screen.dart';
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
                  appBar: appBar(

                    icon1: Icons.favorite,
                      onPressed1: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FavScreen(),
                            ));
                      },
                      title: "LapTops",
                      icon: Icons.shopping_cart,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllProductScreen(),
                            ));
                      }),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: CustomCart(
                                    model: state.list[index],
                                    id: state.list[index].id));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 5,
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
