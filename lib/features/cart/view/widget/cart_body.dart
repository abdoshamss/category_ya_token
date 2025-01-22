import 'package:cached_network_image/cached_network_image.dart';
import 'package:category/core/model/category_model.dart';
import 'package:category/features/cart/cubit/cart_cubit.dart';
import 'package:category/features/cart/model/cart_model.dart';
import 'package:category/features/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../../add_cart/cubit/add_cubit.dart';

class CustomCart extends StatelessWidget {
  final CartModel model;

  const CustomCart({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                cartModel: model,
              ),
            ));
      },
      child: Container(
        width: double.infinity,
        height: 370,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 7,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 380,
                height: 250,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: model.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Text(
                      "name :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red),
                    ),
                    Text(
                      model.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Text(
                      "category : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red),
                    ),
                    Text(
                      model.category.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Text(
                      "Price : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red),
                    ),
                    Text(
                      "\$ ${model.price.toString()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        AddCubit  .get(context).addCartCubit();

                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.red, width: 2)),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.red.shade100,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
