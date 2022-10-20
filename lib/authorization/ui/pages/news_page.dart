import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List products = ["Salem", "Жизнь", "это", "боль"];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${products[index]}'),
              trailing: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: LikeButton(
                  size: 20,
                  circleColor: const CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff00ddff),
                      dotSecondaryColor: Color(0xff00ddff)),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
