import 'package:flutter/material.dart';
import 'package:toonflix/models/m_webtoon_detail.dart';

class WebtoonInfo extends StatelessWidget {
  final WebtoonDetailModel detail;

  const WebtoonInfo({required this.detail, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detail.about,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Text(
          '${detail.genre} / ${detail.age}',
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
