import 'package:flutter/material.dart';
import 'package:toonflix/models/m_webtoon.dart';
import 'package:toonflix/screens/home/widget/w_webtoon_item.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("오늘의 웹툰"),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
  return ListView.separated(
    itemCount: snapshot.data!.length,
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    itemBuilder: (context, index) {
      final webtoon = snapshot.data![index];
      return WebtoonItem(webtoon: webtoon);
    },
    separatorBuilder: (context, index) => const SizedBox(width: 40),
  );
}
