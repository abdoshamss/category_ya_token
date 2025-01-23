import 'package:category/core/helper/cache.dart';
import 'package:category/core/widget/home_container.dart';
import 'package:category/features/cart/view/cart_screen.dart';
import 'package:category/features/shared/shared_screen.dart';
import 'package:category/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../core/widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> endpoints = [
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
      appBar: appBar(
          title: "Categories",
          icon: Icons.logout,
          onPressed: () {
            showLogout(context);
          }),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            HomeContainer(name: "LapTops", index: 0+1, icon: Icons.devices_sharp,onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
            },),
            const SizedBox(height: 25,),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return HomeContainer(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SharedScreen(
                              endpoints: endpoints[index],
                              name: names[index],
                            ),
                          ));
                    },
                    name: names[index],
                    index: (index + 2),
                    icon: icons[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 25,
                  );
                },
                itemCount: 4,
              ),
            ),


          ],
        ),
      ),
    );
  }
}

Future<void> showLogout(BuildContext context) async {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Log out !',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Are u sure u wanna log out?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Log out'),
            onPressed: () {
              Navigator.of(context).pop();
              CacheHelper.removeToken();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
