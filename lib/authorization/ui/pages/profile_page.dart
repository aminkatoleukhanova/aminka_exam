import 'package:amina_ex/authorization/ui/pages/QR_page1.dart';
import 'package:amina_ex/authorization/ui/pages/news_page.dart';
import 'package:amina_ex/authorization/ui/pages/home_page.dart';
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
    const HomePage(),
    const QrPage(),
    const ProfPage(),
    const NewsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: const Icon(Icons.home),
            activeColor: const Color.fromARGB(255, 28, 148, 130),
            inactiveColor: const Color.fromARGB(255, 8, 76, 52),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.qr_code),
            activeColor: const Color.fromARGB(255, 28, 148, 130),
            inactiveColor: const Color.fromARGB(255, 8, 76, 52),
            title: const Text('QR'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.newspaper),
            activeColor: const Color.fromARGB(255, 28, 148, 130),
            inactiveColor: const Color.fromARGB(255, 8, 76, 52),
            title: const Text('News'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.person),
            activeColor: const Color.fromARGB(255, 28, 148, 130),
            inactiveColor: const Color.fromARGB(255, 8, 76, 52),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
