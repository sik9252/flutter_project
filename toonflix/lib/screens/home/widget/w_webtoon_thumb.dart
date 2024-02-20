import 'package:flutter/material.dart';
import 'package:toonflix/models/m_webtoon.dart';

class WebtoonThumb extends StatelessWidget {
  final WebtoonModel webtoon;

  const WebtoonThumb({required this.webtoon, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: webtoon.id,
      child: Container(
        width: 250,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 13,
              offset: const Offset(10, 10),
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ),
        child: Image.network(
          webtoon.thumb,
          headers: const {
            "User-Agent":
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
          },
        ),
      ),
    );
  }
}
