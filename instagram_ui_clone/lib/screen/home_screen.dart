import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [StoryArea(), FeedList()]),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) => UserStory(userName: 'User ${index + 1}'),
          ),
        ));
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            Text(userName)
          ],
        ),
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData.name(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData.name(userName: 'User 1', likeCount: 50, content: '오늘 점심은 고구마'),
  FeedData.name(userName: 'User 2', likeCount: 32, content: '오늘 점심은 탕수육'),
  FeedData.name(userName: 'User 3', likeCount: 99, content: '오늘 저녁은 치킨'),
  FeedData.name(userName: 'User 4', likeCount: 123, content: '회사 가기 싫다'),
  FeedData.name(userName: 'User 5', likeCount: 4, content: '퇴근 하고 싶다'),
  FeedData.name(userName: 'User 6', likeCount: 88, content: '오늘 점심은 김밥'),
  FeedData.name(userName: 'User 7', likeCount: 50, content: '오늘 점심은 쭈꾸미 덮밥'),
  FeedData.name(userName: 'User 8', likeCount: 12, content: '오늘 점심은 당근'),
  FeedData.name(userName: 'User 9', likeCount: 485, content: '오늘 점심은 피자'),
  FeedData.name(userName: 'User 10', likeCount: 0, content: '오늘 점심은 감자튀김'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // 리스트 안에 리스트가 있을때 스크롤 에러 방지
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(feedData.userName)
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.chat_bubble),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.paperplane),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bookmark),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: feedData.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: feedData.content,
                ),
              ],
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
