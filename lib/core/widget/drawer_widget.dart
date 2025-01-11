import 'package:category/features/shared/shared_screen.dart';
import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key,});

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
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SharedScreen(endpoints: endpoints[index],),
                          ));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.indigo.shade300),
                      child:  Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              names[index],
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Icon(
                              icons[index],
                              size: 35,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
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
