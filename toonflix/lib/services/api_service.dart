import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/m_webtoon.dart';
import 'package:toonflix/models/m_webtoon_detail.dart';
import 'package:toonflix/models/m_webtoon_episode.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getWebtoonDetail(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoonDetail = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoonDetail);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getWebtoonEpisode(String id) async {
    List<WebtoonEpisodeModel> episodes = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic>webtoonEpisodes = jsonDecode(response.body);
      for (var episode in webtoonEpisodes) {
        episodes.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodes;
    }
    throw Error();
  }
}
