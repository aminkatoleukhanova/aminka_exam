// ignore_for_file: deprecated_member_use

import 'package:amina_ex/authorization/ui/pages/news_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Notifications()));
                      },
                      child: const IconButton(
                          padding: EdgeInsets.only(left: 50),
                          icon: Icon(Icons.search,
                              color: Colors.black, size: 35.0),
                          onPressed: null),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const IconButton(
                          padding: EdgeInsets.only(right: 50),
                          icon: Icon(Icons.notifications,
                              color: Colors.black, size: 35.0),
                          onPressed: null),
                    ),
                  ],
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsPage()));
                      await context.setLocale(const Locale('kk'));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 6, 42, 13),
                              Color.fromARGB(255, 17, 105, 76)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 370.0, minHeight: 200.0),
                        alignment: Alignment.center,
                        child: const Text(
                          "🇰🇿 ҚАЗАҚША",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    //color: Colors.green,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
