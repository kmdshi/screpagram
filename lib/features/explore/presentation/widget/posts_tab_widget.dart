import 'package:flutter/material.dart';

class PostsTabWidget extends StatelessWidget {
  const PostsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mockPosts = List.generate(
      10,
      (index) => {
        'author': 'Гражданин №${1400 + index}',
        'content':
            'Сегодня я доложил на соседа. Он слишком громко слушал музыку.',
        'timestamp': 'Час назад',
      },
    );

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: mockPosts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final post = mockPosts[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post['author']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(post['content']!),
              const SizedBox(height: 8),
              Text(
                post['timestamp']!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
