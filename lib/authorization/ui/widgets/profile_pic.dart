import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 5, color: Colors.white),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 15, 54, 16),
                  blurRadius: 20,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 8, 60, 39),
              size: 80.0,
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  primary: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 235, 238, 246),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
