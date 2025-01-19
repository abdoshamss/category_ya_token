import 'package:category/core/widget/app_bar.dart';
import 'package:category/core/widget/custom_container.dart';
import 'package:category/core/widget/drawer_widget.dart';
import 'package:category/features/shared/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/cubit/category_cubit.dart';
import '../../core/cubit/category_state.dart';

class SharedScreen extends StatelessWidget {
  final String endpoints,name;
  final int? index;

  const SharedScreen({
    super.key,
    required this.endpoints,
    this.index, required this.name,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => CategoryCubit()..getDataCubit(endpoints),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategorySuccessState) {
                return Scaffold(
                  endDrawer: const DrawerWidget(),
                  appBar: appBar(title: name),
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
