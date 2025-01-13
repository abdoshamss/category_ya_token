import 'package:category/core/widget/home_container.dart';
import 'package:category/features/shared/shared_screen.dart';
import 'package:flutter/material.dart';
import '../../core/widget/app_bar.dart';
class HomeScreen extends StatelessWidget {


  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<String > endpoints = [
      "electronics",
      "jewelery",
      "men's%20clothing",
      "women's%20clothing"
    ];
    const List<String> names = [
      "Electronics",
      "Jewelery",
      "men's clothing",
      "woman's clothing"
    ];
    const List<IconData> icons = [
      Icons.devices_outlined,
      Icons.diamond_outlined,
      Icons.boy,
      Icons.card_giftcard_rounded,
    ];
    return Scaffold(
      appBar: appBar(title: "Categories"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return HomeContainer(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SharedScreen(endpoints: endpoints[index], name: names[index],),
                          ));
                    }, name: names[index], index: (index+2), icon: icons[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 25,
                  );
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
