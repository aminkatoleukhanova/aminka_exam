// ignore_for_file: deprecated_member_use

import 'package:amina_ex/authorization/ui/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(children: [
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
                      icon: Icon(Icons.search, color: Colors.black, size: 35.0),
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
            SizedBox(
              height: 180.0,
              child: PageIndicatorContainer(
                key: key,
                align: IndicatorAlign.bottom,
                length: 4,
                indicatorSpace: 10.0,
                child: PageView(
                  // ignore: sort_child_properties_last
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsPage()));
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
                              maxWidth: 370.0, minHeight: 250.0),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/logo.png",
                            ),
                          ),
                        ),
                      ),
                      //color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsPage()));
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/logo.png",
                            ),
                          ),
                        ),
                      ),
                      //color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsPage()));
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
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 370.0, minHeight: 200.0),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.asset(
                              "assets/images/logo.png",
                            ),
                          ),
                        ),
                      ),
                      //color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsPage()));
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
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 370.0, minHeight: 200.0),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.asset(
                              "assets/images/logo.png",
                            ),
                          ),
                        ),
                      ),
                      //color: Colors.green,
                    ),
                  ],
                  controller: controller,
                  reverse: true,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Data'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 85),
                      primary: const Color.fromARGB(255, 6, 42, 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10.0,
                    )),
                ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Data'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 85),
                      primary: const Color.fromARGB(255, 6, 42, 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10.0,
                    )),
                ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Data'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 85),
                      primary: const Color.fromARGB(255, 6, 42, 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10.0,
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Text("Оценки"),
                Text("Дисциплины"),
                Text("Транскрипт"),
                Padding(
                  padding: EdgeInsets.only(left: 1),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Data'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 85),
                      primary: const Color.fromARGB(255, 6, 42, 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10.0,
                    )),
                ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Data'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 85),
                      primary: const Color.fromARGB(255, 6, 42, 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10.0,
                    )),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 7),
                ),
                Text("Электронный деканат"),
                Text("Расписание"),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text('Дедлайны',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.book_sharp),
                title: Text('TASK 1'),
                subtitle: Text('IT project'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
