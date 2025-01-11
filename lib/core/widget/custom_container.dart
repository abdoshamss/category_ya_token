import 'package:cached_network_image/cached_network_image.dart';
import 'package:category/core/model/category_model.dart';
import 'package:category/features/details/details_screen.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final CategoryModel categoryModel;

  const CustomContainer({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(model: categoryModel),
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
                  imageUrl: categoryModel.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  categoryModel.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Text(
                      "rating : ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red),
                    ),
                    Text(categoryModel.rating.rate.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 25,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red),
                    ),
                    Text("\$ ${categoryModel.price.toString()}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const Spacer(),
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(50),
                          border:
                          Border.all(color: Colors.red,width: 2)),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.red.shade100,
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
