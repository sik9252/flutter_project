import 'package:flutter/material.dart';
import 'package:toonflix/models/m_webtoon.dart';
import 'package:toonflix/models/m_webtoon_detail.dart';
import 'package:toonflix/models/m_webtoon_episode.dart';
import 'package:toonflix/screens/detail/fragment/f_webtoon_info.dart';
import 'package:toonflix/screens/detail/widget/w_episode_item.dart';
import 'package:toonflix/screens/home/widget/w_webtoon_thumb.dart';
import 'package:toonflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonModel webtoon;

  DetailScreen({required this.webtoon, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoonDetail;
  late Future<List<WebtoonEpisodeModel>> webtoonEpisode;

  @override
  void initState() {
    super.initState();
    webtoonDetail = ApiService.getWebtoonDetail(widget.webtoon.id);
    webtoonEpisode = ApiService.getWebtoonEpisode(widget.webtoon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.webtoon.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WebtoonThumb(webtoon: widget.webtoon),
                ],
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: webtoonDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return WebtoonInfo(detail: snapshot.data!);
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: webtoonEpisode,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // ListView, ListView.builder는 내가 리스트의 길이를 모르거나 리스트 길이가 엄청 길때 최적화 필요할때
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          EpisodeItem(episode: episode, webtoonId: widget.webtoon.id),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
