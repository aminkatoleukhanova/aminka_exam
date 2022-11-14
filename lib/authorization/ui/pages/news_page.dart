import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NEWS",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: List.generate(
          10,
          (int index) {
            return _listItem(index);
          },
        ),
      ),
    );
  }

  Widget _listItem(int index) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        child: Image.asset("assets/images/news1.jpeg", fit: BoxFit.cover),
      ),
      title: const Text(
        "6B03 Социальные науки, журналистика и информация",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Социальные науки - это науки об обществе. В рамках университета, в категорию социальных наук попадает огромное количество предметов, таких как политология, экономика, география, психология и даже иногда журналистика. ",
            overflow: TextOverflow.clip,
            maxLines: 3,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(Icons.comment),
              LikeButton(
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
              const Icon(Icons.share),
            ],
          )
        ],
      ),
    );
  }
}
