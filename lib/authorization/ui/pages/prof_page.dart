import 'package:amina_ex/authorization/ui/widgets/user.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;
  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                            padding: EdgeInsets.only(left: 20),
                            icon: Icon(Icons.edit_note_sharp,
                                color: Colors.black, size: 35.0),
                            onPressed: null),
                      ),
                      const Text(
                        "My Profile",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Notifications()));
                        },
                        child: const IconButton(
                            padding: EdgeInsets.only(right: 20),
                            icon: Icon(Icons.logout_rounded,
                                color: Colors.black, size: 25.0),
                            onPressed: null),
                      ),
                    ]),
                const SizedBox(height: 20),
                const CircleAvatar(
                  minRadius: 85,
                  backgroundColor: Color.fromARGB(255, 9, 93, 26),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/ava.jpeg"),
                    minRadius: 80,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userInfo.name,
                  style: const TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "student",
                  style: TextStyle(
                      fontSize: 14.0, color: Color.fromARGB(255, 11, 74, 43)),
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                ListTile(
                  leading: const Icon(
                    Icons.mail,
                    color: Color.fromARGB(255, 12, 86, 50),
                  ),
                  title: const Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    userInfo.email,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.phone,
                      color: Color.fromARGB(255, 12, 86, 50)),
                  title: const Text(
                    "Phone",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    userInfo.phone,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.flag,
                      color: Color.fromARGB(255, 12, 86, 50)),
                  title: const Text(
                    "Country",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    userInfo.country,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.grade,
                      color: Color.fromARGB(255, 12, 86, 50)),
                  title: const Text(
                    "Gender",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    userInfo.gender,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.grading,
                      color: Color.fromARGB(255, 12, 86, 50)),
                  title: const Text(
                    "Speciality",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    userInfo.speciality,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const Divider(),
              ]))
        ],
      ),
    );
  }
}
