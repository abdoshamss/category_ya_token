import 'package:cached_network_image/cached_network_image.dart';
import 'package:category/core/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../core/widget/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final CategoryModel? model;

  const DetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: CachedNetworkImage(
                  imageUrl: model!.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              model!.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                const Text("Rating : ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                Text(model!.rating.rate.toString()),
                const Icon(Icons.star,color: Colors.yellow,)
              ],
            ),
            Text(model!.description),
          ],
        ),
      ),
    );
  }
}
