import 'package:flutter/material.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 10),
            Text(post.authorId.substring(1, 5),
                style: TextStyle(fontWeight: FontWeight.w600)),
            Spacer(),
            Text(formatTimeAgo(post.timestamp),
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        SizedBox(height: 10),
        Text(
          post.content,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  String formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} секунд назад';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} минут назад';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} часов назад';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} дней назад';
    } else {
      return '${dateTime.day.toString().padLeft(2, '0')}.'
          '${dateTime.month.toString().padLeft(2, '0')}.'
          '${dateTime.year}';
    }
  }
}
