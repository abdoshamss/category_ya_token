import 'package:category/features/home/home_screen.dart';
import 'package:category/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({
    super.key,
  });

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const ProfileScreen(),
    ];
    List<Map<String, dynamic>> list = [
      {"title": "Home", "icon": Icons.home},
      {"title": "profile", "icon": Icons.person},
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
                icon: Icon(list[index]["icon"]), label: list[index]["title"]),
          )),
    );
  }
}
