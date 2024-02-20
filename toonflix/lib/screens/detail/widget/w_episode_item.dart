import 'package:flutter/material.dart';
import 'package:toonflix/models/m_webtoon_episode.dart';

class EpisodeItem extends StatelessWidget {
  final WebtoonEpisodeModel episode;

  const EpisodeItem({required this.episode, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(episode.title),
      ],
    );
  }
}
