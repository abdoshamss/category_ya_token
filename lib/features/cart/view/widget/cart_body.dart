import 'package:cached_network_image/cached_network_image.dart';
import 'package:category/features/cart/fav/cubit/fav_cubit.dart';
import 'package:category/features/cart/model/cart_model.dart';
import 'package:category/features/details/details_screen.dart';
import 'package:flutter/material.dart';
import '../../add_cart/cubit/add_cubit.dart';

class CustomCart extends StatefulWidget {
  final CartModel model;
  final String id;

  const CustomCart({
    super.key,
    required this.model,
    required this.id,
  });

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  bool isPressed = false;
  bool isPressedC = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                cartModel: widget.model,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 380,
                height: 250,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: widget.model.image,
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
                      widget.model.name,
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
                      widget.model.category.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
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
                        "\$ ${widget.model.price.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isPressedC = !isPressedC;
                              });
                              isPressedC
                                  ? FavCubit.get(context)
                                      .addFavCubit(id: widget.id)
                                  : FavCubit.get(context)
                                      .deleteFavCubit(id: widget.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      isPressedC ? Colors.green : Colors.red,
                                  content: Text(
                                    isPressedC
                                        ? "item added successfully"
                                        : "item removed successfully",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(color: Colors.red, width: 2)),
                              child: Icon(
                                Icons.favorite,
                                color: isPressedC
                                    ? Colors.red
                                    : Colors.red.shade100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isPressed = !isPressed;
                              });
                              isPressed
                                  ? AddCubit.get(context)
                                      .addCartCubit(id: widget.id)
                                  : AddCubit.get(context)
                                      .deleteAllCubit(id: widget.id);
                              //AddCubit.get(context).addCartCubit(id: widget.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      isPressed ? Colors.green : Colors.red,
                                  content: Text(
                                    isPressed
                                        ? "item added successfully"
                                        : "item removed successfully",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(color: Colors.red, width: 2)),
                              child: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: isPressed
                                    ? Colors.red
                                    : Colors.red.shade100,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
