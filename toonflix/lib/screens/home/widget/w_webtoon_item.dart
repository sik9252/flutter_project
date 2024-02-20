import 'package:flutter/material.dart';
import 'package:toonflix/models/m_webtoon.dart';
import 'package:toonflix/screens/detail/s_detail.dart';
import 'package:toonflix/screens/home/widget/w_webtoon_thumb.dart';

class WebtoonItem extends StatelessWidget {
  final WebtoonModel webtoon;

  const WebtoonItem({required this.webtoon, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailScreen(webtoon: webtoon)));
      },
      child: Column(
        children: [
          WebtoonThumb(webtoon: webtoon),
          const SizedBox(height: 10),
          Text(
            webtoon.title,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
