import 'package:flutter/material.dart';
import 'package:toonflix/models/m_webtoon_episode.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodeItem extends StatefulWidget {
  final WebtoonEpisodeModel episode;
  final String webtoonId;

  EpisodeItem({required this.episode, required this.webtoonId, super.key});

  @override
  State<EpisodeItem> createState() => _EpisodeItemState();
}

class _EpisodeItemState extends State<EpisodeItem> {
  late final Uri _url;

  @override
  void initState() {
    super.initState();
    _url = Uri.parse(
        'https://comic.naver.com/webtoon/detail?titleId=${widget.webtoonId}&no=${widget.episode.id}');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  widget.episode.title,
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
