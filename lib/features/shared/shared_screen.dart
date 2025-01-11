import 'package:category/core/widget/app_bar.dart';
import 'package:category/core/widget/custom_container.dart';
import 'package:category/core/widget/drawer_widget.dart';
import 'package:category/features/shared/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/cubit/category_cubit.dart';
import '../../core/cubit/category_state.dart';
import '../../core/model/category_model.dart';

class SharedScreen extends StatelessWidget {
  final String endpoints;
  final int? index;
  final CategoryModel? categoryModel;

  const SharedScreen({
    super.key,
    required this.endpoints,
    this.index, this.categoryModel,
  });


  @override
  Widget build(BuildContext context) {
    const List<String> names = [
      "Electronics",
      "Jewelery",
      "men's clothing",
      "woman's clothing"
    ];
    return Scaffold(
      body: BlocProvider(
          create: (context) => CategoryCubit()..getDataCubit(endpoints),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              print(categoryModel?.category);
              if (state is CategorySuccessState) {
                return Scaffold(
                  drawer: const DrawerWidget(),
                  appBar: appBar(title: endpoints),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CustomContainer(
                                categoryModel: state.product[index],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 25,
                            );
                          },
                          itemCount: state.product.length,
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is CategoryFailureState) {
                return const Text("fail");
              }
              return const Loading();
            },
          )),
    );
  }
}
