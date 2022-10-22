// ! first you need to add flashy_tab_bar 0.0.3 or + From here https://pub.dev/packages/flashy_tab_bar/install
import 'package:amina_ex/authorization/ui/pages/fav_page.dart';
import 'package:amina_ex/authorization/ui/pages/home_page.dart';
import 'package:amina_ex/authorization/ui/pages/news_page.dart';
import 'package:amina_ex/authorization/ui/pages/prof_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  final tabItems = [
    const NewsPage(),
    const FavPage(),
    const ProfPage(),
    const HomePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Page",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: <Color>[
                  Color.fromRGBO(4, 101, 87, 1),
                  Color.fromARGB(255, 134, 190, 136),
                ])),
          ),
        ),
        body: Center(
          child: tabItems[_selectedIndex],
        ),
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: const Icon(Icons.newspaper),
              activeColor: const Color.fromARGB(255, 81, 142, 203),
              inactiveColor: const Color.fromARGB(255, 20, 172, 134),
              title: const Text('News'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.favorite),
              activeColor: const Color.fromARGB(255, 220, 51, 18),
              inactiveColor: const Color.fromARGB(255, 20, 172, 134),
              title: const Text('Favorite'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.home),
              activeColor: const Color.fromARGB(255, 5, 51, 20),
              inactiveColor: const Color.fromARGB(255, 20, 172, 134),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.person),
              activeColor: const Color.fromARGB(255, 16, 62, 188),
              inactiveColor: const Color.fromARGB(255, 20, 172, 134),
              title: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
