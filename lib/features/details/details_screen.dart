import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:category/core/model/category_model.dart';
import 'package:category/features/cart/model/cart_model.dart';
import '../../core/widget/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final CategoryModel? categoryModel;
  final CartModel? cartModel;

  const DetailsScreen({
    super.key,
    this.categoryModel,
    this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: 'Details',
          icon: Icons.arrow_back_ios,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: categoryModel != null
            ? Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: CachedNetworkImage(
                        imageUrl: categoryModel!.image,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    categoryModel!.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Rating : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      Text(categoryModel!.rating.rate.toString()),
                      const Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                  Text(categoryModel!.description),
                ],
              )
            : cartModel != null
                ? Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 500,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: cartModel!.image,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            "status : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20),
                          ),
                          Text(
                            cartModel?.status ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Name: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20),
                          ),
                          Text(
                            cartModel!.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Price : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20),
                          ),
                          Text(
                            "\$ ${cartModel?.price?.toString() ?? ""}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "status : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20),
                          ),
                          Text(
                            cartModel?.status ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  )
                : const Center(
                    child: Text(
                      'No data available.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
      ),
    );
  }
}
