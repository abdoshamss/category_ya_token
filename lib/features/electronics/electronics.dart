import 'package:category/core/widget/app_bar.dart';
import 'package:category/core/widget/custom_container.dart';
import 'package:category/core/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/cubit/category_cubit.dart';
import '../../core/cubit/category_state.dart';

class Electronics extends StatelessWidget {
  final String? endpoints;

  const Electronics({super.key, this.endpoints});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoryCubit()..getDataCubit("electronics" ?? "0"),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySuccessState) {
              return Scaffold(
                drawer: const DrawerWidget(),
                appBar: appBar(title: "Electronics"),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
            return const CircularProgressIndicator();
          },
        ));
  }
}
